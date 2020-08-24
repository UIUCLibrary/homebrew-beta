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
def pipelineParameters = {
    booleanParam( defaultValue: false, description: '', name: 'BUILD_P')
}

def get_pipelineParameters(){
    return {
        booleanParam( defaultValue: false, description: '', name: 'BUILD_P')
    }
}
pipeline{
    agent none
    parameters {
        booleanParam defaultValue: true, description: '', name: 'AUDIT_FORMULA'
        booleanParam defaultValue: false, description: '', name: 'BUILD_PACKAGES'
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
            when{
                equals expected: true, actual: params.BUILD_PACKAGES
                beforeInput true
                beforeAgent true
            }
            input {
                message 'Build the following'
                parameters {
                    choice choices: formulas, description: '', name: 'HOMEBREW_FORMULA_FILE'
                }
            }
            stages{
                stage("Uninstall existing formula"){
                    steps{
                        sh returnStatus:true, script: "brew uninstall ${HOMEBREW_FORMULA_FILE} -v"
                    }

                }
                stage("Building bottle"){
                    steps{
                        sh "brew install --build-bottle ${HOMEBREW_FORMULA_FILE} -v"
                    }
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