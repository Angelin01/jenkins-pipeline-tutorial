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
                sh 'mvn clean'
            }
        }

        stage('Complie') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                 sh 'mvn verify'
                 junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Deploy') {
            steps {
                 script {
                    def pom = readMavenPom(file: 'pom.xml')
                    sh "./deploy.sh ${pom.getArtifactId()} ${pom.getVersion()}"
                 }
            }
        }
    }
}