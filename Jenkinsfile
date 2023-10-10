pipeline {
    agent any

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

    //     stage('Push Docker Image') {
    //         steps {
    //             script {
    //                 docker.withRegistry('https://registry.example.com', 'registry-credentials') {
    //                     dockerImageName.push("${env.BUILD_NUMBER}")
    //                     dockerImageName.push("latest")
    //                 }
    //             }
    //         }
    //     }
    // }

    post {
        success {
            echo 'The Docker image was successfully built.'
        }
    }
}