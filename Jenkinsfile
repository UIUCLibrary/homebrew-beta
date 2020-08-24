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
// TODO: remove this and turn the choice input back on
def HOMEBREW_FORMULA_FILE = "getmarc.rb"

def pipelineParameters = {
    booleanParam( defaultValue: false, description: '', name: 'BUILD_P')
}

pipeline{
    agent none
    parameters {
//         todo: change this to true
        booleanParam defaultValue: false, description: '', name: 'AUDIT_FORMULA'
//         todo: change this to false
        booleanParam defaultValue: true, description: '', name: 'BOTTLE_FORMULA'
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
//             input {
//                 message 'Build the following'
//                 parameters {
//                     choice choices: formulas, description: 'Bottle Homebrew formula', name: 'HOMEBREW_FORMULA_FILE'
//                 }
//             }
            stages{
                stage("Uninstall existing formula"){
                    steps{
                        sh(label: "Removing ${HOMEBREW_FORMULA_FILE}",
                           script: "brew uninstall ${HOMEBREW_FORMULA_FILE} -v",
                           returnStatus:true
                        )
                    }

                }
                stage("Building bottle"){
                    steps{
                        sh "brew install --build-bottle ${HOMEBREW_FORMULA_FILE} -v"
                    }
                }
                stage("Adding bottle to current formula"){
                    steps{
                        sh(label: "Creating a bottle package",
                           script: """brew bottle --force-core-tap --json --root_url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ ${HOMEBREW_FORMULA_FILE}
                                      brew bottle --merge \$(find . -type f -name "*bottle.json") --write --no-commit --verbose
                                      """
                        )
                    }
                }
                stage("Upload new bottle to storage"){
                    steps{
                        script{
                            findFiles( excludes: '', glob: '*.bottle.json').each{
                                echo "Reading ${it.path}"
                                def all_metadata = readJSON( file: it.path)
                                echo "Got ${all_metadata}"
                                def formulaName = HOMEBREW_FORMULA_FILE.replace(".rb", "")
                                def bottle = all_metadata[formulaName]['bottle']
                                echo "Got bottle ${bottle}"
                                def upload_url = bottle['root_url']
                                echo "Got bottle url ${upload_url}"
                                bottle['tags'].each {
                                    echo "got ${it}"
                                    def tag = readJSON(text: it)
                                    echo "got tag ${tag}"

                                    def local_filename = it['local_filename']
                                    def filename = it['filename']
                                    echo "Using ${local_filename} to upload as ${local_filename}"
                                }
//                                 def localBottleArchive =

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
                        script: "brew uninstall ${HOMEBREW_FORMULA_FILE} -v",
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