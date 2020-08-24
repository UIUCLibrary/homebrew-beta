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