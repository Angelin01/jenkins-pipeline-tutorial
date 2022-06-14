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
               mvn 'clean'
            }
        }

        stage('Build') {
            steps {
                mvn 'compile'
            }
        }

        stage('Test') {
            steps {
                mvn 'verify'
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def artifactId = readPom('project.artifactId')
                    def version = readPom('project.version')
                    sh "./deploy.sh $artifactId $version"
                    currentBuild.description = "Deploy completo do artefato $artifactId na  versão $version"
                }
            }
        }
    }
}

def mvn(String args) {
    sh "mvn --no-transfer-progress -B $args"
}

def readPom(String expression) {
    return sh(script: """mvn help:evaluate -Dexpression="$expression" -q -DforceStdout""", returnStdout: true)
}