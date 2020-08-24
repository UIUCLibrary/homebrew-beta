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
        booleanParam defaultValue: false, description: '', name: 'BUILD_PACKAGES'
    }
    stages{
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
                    booleanParam defaultValue: false, description: '', name: 'BUILD_PACKAGE'
                }
            }
            steps{
                script{
                    formulas.each{
                        echo "Got ${it.path}"

                    }
                }
            }
        }
    }
}