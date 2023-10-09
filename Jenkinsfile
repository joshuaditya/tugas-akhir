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
                // Install Node.js and project dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build your Node.js application (e.g., compile TypeScript or run Webpack)
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Define Dockerfile and context path
                    def dockerfile = 'Dockerfile'
                    def buildContext = '.'
                    def dockerImageName = 'my-nodejs-app'

                    // Build the Docker image
                    docker.build(dockerImageName, '-f ${dockerfile} ${buildContext}')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a container registry (e.g., Docker Hub)
                    docker.withRegistry('https://registry.example.com', 'registry-credentials') {
                        dockerImageName.push("${env.BUILD_NUMBER}")
                        dockerImageName.push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'The Docker image was successfully built and pushed.'
        }
    }
}
