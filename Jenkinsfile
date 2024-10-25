pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "namespace/myimagesrepo1"
        DOCKER_REGISTRY_CREDENTIALS = 'd188f597-dd8a-44a4-9998-e4ca1c05ed63'
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
                    sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_ID} ."
                    echo "Docker Image check111....!."

                    // Login and push to Docker registry if desired
                    docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
                        sh "docker push ${DOCKER_IMAGE}:${env.BUILD_ID}"
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
