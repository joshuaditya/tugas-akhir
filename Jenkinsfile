pipeline {
    agent any

    tools {
        nodejs 'node:20-alpine'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
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