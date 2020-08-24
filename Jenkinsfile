node('master') {
    stage("Dummy"){
        ws{
            def formulas =  findFiles excludes: '', glob: '*.rb'
            formulas.each{
                echo "Found ${it.path}"

            }
        }
    }
}