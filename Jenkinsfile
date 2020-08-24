node('master') {
    stage("Dummy"){
        ws{
            checkout scm
            def formulas =  findFiles excludes: '', glob: '*.rb'
            formulas.each{
                echo "Found ${it.path}"

            }
        }
    }
}