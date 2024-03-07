pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
//       stage("Sonarqube Analysis "){
//            steps{
//                //withSonarQubeEnv('sonar-server') {
//                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=practice-docker \
//                    -Dsonar.projectKey=practice-docker '''
//                }
//            }
//        }
        stage("quality gate"){
           steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonar' 
                }
            } 
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nodeapp:latest .'
            }
        }

        stage('Run Docker Image'){
            steps {
                sh 'docker run -p 3000:3000 -d nodeapp:latest'
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy image --exit-code 1 --severity HIGH,CRITICAL nodeapp:latest'
            }
        }
    }

    post {
        success {
            echo 'The Docker image was successfully running on port 3000.'
        }
        failure {
            echo 'There was a failure in the pipeline.'
            cleanup()
        }
    }
}

def cleanup() {
    // Stop and remove the Docker container
    sh 'docker stop $(docker ps -q --filter ancestor=nodeapp:latest)'
    sh 'docker rm $(docker ps -aq --filter ancestor=nodeapp:latest)'

    // Remove the Docker image
    sh 'docker rmi nodeapp:latest'
}
