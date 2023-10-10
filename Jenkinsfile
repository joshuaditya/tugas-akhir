pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nodeapp:latest .'
            }
        }
    }
    
    post {
        success {
            echo 'The Docker image was successfully built.'
        }
    }
}