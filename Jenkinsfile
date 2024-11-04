pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "557690598346.dkr.ecr.us-east-1.amazonaws.com/test-repo"
        DOCKER_REGISTRY_CREDENTIALS = 'docker-credentials-id'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code
                checkout scm
            }
        }
        
        stage('Maven Build') {
            steps {
                script {
                    // Maven build: clean, compile, test, and package
                    sh 'mvn clean package'
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    // Build Docker image using Dockerfile in the root directory
                    sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_ID} ."

                    // Login and push to Docker registry if desired
                    docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
                        sh "docker push ${DOCKER_IMAGE}:${env.BUILD_ID}"
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            echo "Build and Docker stages completed successfully."
        }
        failure {
            echo "Build or Docker stages failed."
        }
    }
}
