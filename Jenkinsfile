def formulas
node('master') {
    stage("Checking Formula files"){
        ws{
            checkout scm
            formulas =  findFiles excludes: '', glob: '*.rb'
            formulas.each{
                echo "Found ${it.path}"

            }
        }
    }
}
pipeline{
    agent none
    stages{
        stage("Build"){
            agent {
                label 'mac'
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