pipeline {
    agent any
    environment {
        // Define your Docker image name and tag
        DOCKER_IMAGE = 'berezovsky8/devops-python-app'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Clone the specific repository
                git url: 'https://github.com/berezovsky13/python.git', branch: 'main'
            }
        }
        stage('Docker Build & Tag') {
            steps {
                script {
                    // Build and tag the Docker image
                    dockerImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Docker Run') {
            steps {
                script {
                    // Run the container (adjust options as needed)
                    sh "docker run -d --name devops-python-app-container ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
    post {
        always {
            // Optionally clean up: stop the container if it's still running
            sh "docker stop devops-python-app-container || true"
        }
    }
}
