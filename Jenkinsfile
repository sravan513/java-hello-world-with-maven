pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "name/sravanecr"
        DOCKER_REGISTRY_CREDENTIALS = '0cd5aeaf-f787-42a2-934c-4c3f11c330b4'
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
                      echo "Docker Image check....!."
                    sh "sudo docker build -t ${DOCKER_IMAGE}:${env.BUILD_ID} ."
                    echo "Docker Image check111....!."

                    // Login and push to Docker registry if desired
                    docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
                        sh "sudo docker push ${DOCKER_IMAGE}:${env.BUILD_ID}"
                        echo "Docker Image check222....!."
                    }
                }
            }
        }
    }

    post {
        //always {
            // Clean up workspace
            //cleanWs()
       // }
        success {
            echo "Build and Docker stages completed successfully."
        }
        failure {
            echo "Build or Docker stages failed."
        }
    }
}
