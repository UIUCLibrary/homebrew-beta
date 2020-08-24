def formulas
node('master') {
    stage("Checking Ruby files"){
        ws{
            checkout scm
            formulas =  findFiles excludes: '', glob: '*.rb'
            formulas.each{
                echo "Found ${it.path}"

            }
        }
    }
}