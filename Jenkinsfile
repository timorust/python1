pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'berezovsky8/devops-python-app'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Cleanup Workspace') {
            steps {
                deleteDir()  // This removes all files, including hidden ones.
            }
        }
        stage('Checkout Code') {
            steps {
                // Now clone the repository into a clean workspace.
                sh 'git clone https://github.com/berezovsky13/python.git .'
            }
        }
        stage('Docker Build & Tag') {
            steps {
                sh "docker build -t berezovsky8/devops-python-app:latest ."
            }
        }
        
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
        
        stage('Docker Run') {
            steps {
                sh "docker run -d --name devops-python-app-container ${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }
        
        
    }
    
}
