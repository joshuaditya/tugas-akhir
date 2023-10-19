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

        stage('Run Docker Image'){
            steps {
                sh 'docker run -p 3000:3000 -d nodeapp:latest'
            }
        }
    }
    
    post {
        success {
            echo 'The Docker image was successfully running on port 3000.'
        }
    }
}