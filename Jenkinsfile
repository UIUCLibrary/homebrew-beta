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
        booleanParam defaultValue: false, description: '', name: 'BUILD_PACKAGES'
    }
    stages{
        stage("Build"){
//             agent {
//                 label 'mac'
//             }
            when{
                equals expected: true, actual: params.BUILD_PACKAGES
                beforeInput true
//                 beforeAgent true
            }
            input {
                message 'Build the following'
                parameters {
                    choice choices: ['sd', 'sdcv'], description: '', name: 'ad'
                    }
            }
            steps{
                script{
//                     input(
//                         message: 'Build the following',
//                         parameters: get_pipelineParameters()
//                         [
//                             booleanParam(defaultValue: false, description: '', name: 'sss')
//                         ]
//                     )
                    formulas.each{
                        echo "Got ${it.path}"

                    }
                }
            }
        }
    }
}