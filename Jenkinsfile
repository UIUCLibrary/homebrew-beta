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
                                        sh "brew audit --formula ${it.path} --verbose"
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
                stage("Homebrew test-bot"){
                    steps{
                        script{
                            if(INSTALL_HEAD == true){
                                sh "brew install --build-bottle ${HOMEBREW_FORMULA_FILE} --HEAD"
                            } else{
                                sh(label:"Running Homebrew Test-Bot",
                                    script: "sh ./build_bottle.sh ${HOMEBREW_FORMULA_FILE}"
//                                    script: """mkdir -p \$(brew --repo)/Library/Taps/uiuclibrary
//                                               ln -s ${WORKSPACE} \$(brew --repo uiuclibrary/jenkins-${JOB_BASE_NAME})
//                                               trap "brew untap uiuclibrary/jenkins-${JOB_BASE_NAME}" EXIT
//                                               brew test-bot --verbose --debug --tap uiuclibrary/jenkins-${JOB_BASE_NAME} --root-url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ --only-formulae ${HOMEBREW_FORMULA_FILE}
//                                               git status
//                                               """
//                                               brew test-bot --local --root-url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ --verbose --skip-setup ${HOMEBREW_FORMULA_FILE}
                                )
                            }
                        }
                    }
                    post{
                        always{
                            sh 'ls -laR'
                            archiveArtifacts artifacts: "logs/,steps_output.txt"
                            archiveArtifacts(artifacts: '*.bottle.tar.gz,*.bottle.json', allowEmptyArchive: true)
                        }
                        failure{
                            sh "brew config"
                        }
                        cleanup{
                            sh "brew tap --repair"
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

//                 stage("Adding bottle to current formula"){
//                     steps{
//                         sh(label: "Creating a bottle package",
//                            script: """brew bottle --force-core-tap --json --root_url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ ${HOMEBREW_FORMULA_FILE}
//                                       brew bottle --merge \$(find . -type f -name "*bottle.json") --write --no-commit --verbose
//                                       """
//                         )
//                     }
//                 }
                stage("Upload new bottle to repository"){
                    input {
                        message 'Upload artifact?'
                        // parameters {
                        //     string defaultValue: '', description: 'Nexus Username', name: 'NEXUS_USR', trim: true
                        //     password defaultValue: '', description: 'Nexus Password', name: 'NEXUS_PSW'
                        // }
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
                                def jsonData = readJSON( file: it.path)
                                def bottle
                                def key = "uiuclibrary/build/${formulaName}".toLowerCase()
                                try{
                                    bottle = jsonData[key]['bottle']
                                } catch(Exception e){
                                    echo "jsonData = ${jsonData}"
                                    error "invalid data with key ${key}"
                                }


                                bottle['tags'].each { tag, tagData ->
                                    try{
                                        def localFilename = tagData['local_filename']
                                        if(!localFilename){
                                            error "${tag} is missing required field local_filename"
                                        }

                                        def filename = tagData['filename']
                                        if(!filename){
                                            error "${tag} is missing required field filename"
                                        }
                                        def uploadFile = bottle['root_url'] + filename
                                        if(!uploadFile){
                                            error "${tag} is missing required field root_url"
                                        }
                                        def response = httpRequest authentication: 'jenkins-nexus', httpMode: 'PUT', uploadFile: tagData['local_filename'], url: "https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/${filename}", wrapAsMultipart: false
                                        // withEnv([
                                        //     "uploadFile=${bottle['root_url'] + filename}",
                                        //     "localFilename=${tagData['local_filename']}"
                                        //     ]) {
                                        //     sh(label: "Using ${localFilename} to upload to ${uploadFile}",
                                        //        script: 'curl --silent --user $NEXUS_USR:$NEXUS_PSW --upload-file $localFilename $uploadFile'
                                        //    )
                                        // }
                                    } catch(Exception e){
                                        echo "Unable to upload bottle with the following information.\n${tagData}"
                                        throw e;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            post{
//                 always{
//                     archiveArtifacts artifacts: "*.bottle.*,${HOMEBREW_FORMULA_FILE}"
//                 }
                cleanup{
                    sh( label: "Removing ${HOMEBREW_FORMULA_FILE}",
                        script: "brew uninstall ${HOMEBREW_FORMULA_FILE} -v || echo '${HOMEBREW_FORMULA_FILE} not installed'",
                        returnStatus:true
                    )
                    cleanWs(
                        deleteDirs: true,
                        patterns: [
                            [pattern: '*.bottle.*', type: 'INCLUDE'],
                        ]
                    )
                }
            }
        }
    }
}