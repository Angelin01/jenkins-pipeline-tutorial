pipeline {
    agent {
        label 'maven'
    }

    parameters {
        booleanParam name: 'CLEAN_BEFORE', description: 'Executa o passo de "clean" antes do build'
    }

    stages {
        stage('Clean') {
            when {
                expression { params.CLEAN_BEFORE }
            }
            steps {
                // One or more steps need to be included within the steps block.
                echo 'Clean step'
            }
        }

        stage('Build') {
            steps {
                echo 'Build step'
            }
        }

        stage('Test') {
            steps {
                echo 'Test step'
            }
        }
    }
}