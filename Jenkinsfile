def formulas = []
node('master') {
    stage("Checking Formula files"){
        ws{
            checkout scm
            findFiles( excludes: '', glob: '*.rb').each{
                echo "Found ${it.path}"
                formulas << it
            }
        }
    }
}


pipeline{
    agent none
    parameters {
        booleanParam defaultValue: true, description: '', name: 'AUDIT_FORMULA'
        booleanParam defaultValue: false, description: '', name: 'BOTTLE_FORMULA'
        booleanParam defaultValue: false, description: '', name: 'BOTTLE_UPLOAD'
    }
    stages{
        stage("Audit"){
            when{
                equals expected: true, actual: params.AUDIT_FORMULA
                beforeAgent true
            }
            steps{
                script{
                    def forumla_audits = [:]
                    formulas.each{
                        forumla_audits[it.path] = {
                            node('mac') {
                                stage("Auditing ${it.path}"){
                                    checkout scm
                                    catchError(buildResult: 'UNSTABLE', stageResult: 'UNSTABLE', message: "${it.path} failed audit") {
                                        sh "brew audit ${it.path}"
                                    }
                                }
                            }
                        }
                    }
                    parallel(forumla_audits)
                }
            }
        }
        stage("Build"){
            agent {
                label 'mac'
            }
            options {
                lock('homebrew')
            }
            when{
                equals expected: true, actual: params.BOTTLE_FORMULA
                beforeInput true
                beforeAgent true
                beforeOptions true
            }
            input {
                message 'Build the following'
                parameters {
                    choice choices: formulas, description: 'Bottle Homebrew formula', name: 'HOMEBREW_FORMULA_FILE'
                    booleanParam defaultValue: false, description: 'Use head instead of version in formula', name: 'INSTALL_HEAD'
                }
            }
            stages{
                stage("Run homebrew test-bot"){
                    steps{
                        script{
                            echo "using ${WORKSPACE}/${HOMEBREW_FORMULA_FILE}"
                            def head_command = ""
                            if(INSTALL_HEAD == true){
                                sh "brew install --build-bottle ${HOMEBREW_FORMULA_FILE} --HEAD"
                            } else{
                                sh "brew test-bot --local --root-url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ --verbose --skip-setup ${HOMEBREW_FORMULA_FILE}"
                            }
                        }
                    }
                    post{
                        always{
                            archiveArtifacts artifacts: "logs/,steps_output.txt"
                        }
                        cleanup{
                            cleanWs(
                                deleteDirs: true,
                                patterns: [
                                    [pattern: 'logs/', type: 'INCLUDE'],
                                    [pattern: 'home/', type: 'INCLUDE'],
                                    [pattern: 'steps_output.txt', type: 'INCLUDE'],
                                ]
                            )
                        }
                    }
                }
                stage("Adding bottle to current formula"){
                    steps{
                        script{
                            findFiles( excludes: '', glob: '*.bottle.json').each{
                                def formulaName = HOMEBREW_FORMULA_FILE.replace(".rb", "")
                                def bottleMetadata = readJSON( file: it.path)
                                bottleMetadata["uiuclibrary/beta/${formulaName}"]['formula']['path'] = "${WORKSPACE}/${HOMEBREW_FORMULA_FILE}"
                                echo "bottleMetadata = ${bottleMetadata}"
                                writeJSON file: it.path , json: bottleMetadata
//                                 sh "python3 -c 'import sys,json,os;data=json.load(sys.stdin);formula=data[list(data.keys())[0]][\"formula\"][\"path\"];data[list(data.keys())[0]][\"formula\"][\"path\"]=os.path.split(formula)[-1];print(data)' <  ${it}.path"
                                sh(label: "Creating a bottle package",
                                   script: "brew bottle --merge ${it.path} --write --no-commit --verbose"
                                )
                            }
                        }
                        sh "git status"
//                           script: """brew bottle --force-core-tap --json --root_url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ ${HOMEBREW_FORMULA_FILE}
//                                       brew bottle --merge \$(find . -type f -name "*bottle.json") --write --no-commit --verbose
//                                       """
                    }
                }
                stage("Upload new bottle to repository"){
                    input {
                        message 'Upload artifact?'
                        parameters {
                            string defaultValue: '', description: '', name: 'NEXUS_USR', trim: true
                            password defaultValue: '', description: '', name: 'NEXUS_PSW'
                        }
                    }
                    options {
                        retry(3)
                    }
                    when{
                        equals expected: true, actual: params.BOTTLE_UPLOAD
                        beforeInput true
                    }
                    steps{
                        script{
                            findFiles( excludes: '', glob: '*.bottle.json').each{
                                def formulaName = HOMEBREW_FORMULA_FILE.replace(".rb", "")

                                def bottle = readJSON( file: it.path)["uiuclibrary/beta/${formulaName}"]['bottle']
                                bottle['tags'].each { tag, tagData ->
                                    def local_filename = tagData['local_filename']
                                    def filename = tagData['filename']
                                    def uploadFile = bottle['root_url'] + filename
                                    sh(label: "Using ${local_filename} to upload to ${uploadFile}",
                                       script: "curl -v --user '${NEXUS_USR}:${NEXUS_PSW}' --upload-file ${local_filename} ${uploadFile}"
                                   )

                                }
                            }
                        }
                    }
                }
            }
            post{
                success{
                    archiveArtifacts artifacts: "*.bottle.*,${HOMEBREW_FORMULA_FILE}"
                }
                cleanup{
                    sh( label: "Removing ${HOMEBREW_FORMULA_FILE}",
                        script: "brew uninstall ${HOMEBREW_FORMULA_FILE} -v || echo '${HOMEBREW_FORMULA_FILE} not installed'",
                        returnStatus:true
                    )
                }
            }
//             steps{
//                 echo "Using ${HOMEBREW_FORMULA_FILE}"
//                 script{
//                     formulas.each{
//                         echo "Got ${it.path}"
//
//                     }
//                 }
//             }
        }
    }
}