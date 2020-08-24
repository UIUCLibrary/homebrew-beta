node {
    stage("Dummy"){
        def formulas =  findFiles excludes: '', glob: '*.rb'
        formulas.each{
            echo "Found ${it.path}"

        }
    }
}