pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Clean Up Old Docker Image') {
            steps {
                script {
                    try {
                        // Stop running containers based on the image
                        sh 'docker stop $(docker ps -q --filter ancestor=ramata:latest) || true'
                        // Remove stopped containers
                        sh 'docker rm $(docker ps -aq --filter ancestor=ramata:latest) || true'
                        // Remove the image
                        sh 'docker rmi ramata:latest || true'
                    } catch (Exception e) {
                        echo 'No old Docker images to clean up.'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t ramata:latest .'
            }
        }

        stage('Run Docker Image') {
            steps {
                sh 'docker run -p 3000:3000 -d ramata:latest'
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
    // Correct the Docker container and image names in the cleanup steps to match 'ramata:latest'
    sh 'docker stop $(docker ps -q --filter ancestor=ramata:latest) || true'
    sh 'docker rm $(docker ps -aq --filter ancestor=ramata:latest) || true'
    // Uncomment this if you want to remove the Docker image as well
    sh 'docker rmi ramata:latest || true'
}
