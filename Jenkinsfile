pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'https://hub.docker.com'
        REGISTRY_CREDENTIALS = credentials('your-dockerhub-credentials-id') // Jenkins credentials ID
        IMAGE_NAME = 'docker.io/raptor1702/test'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("$IMAGE_NAME:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("$DOCKER_REGISTRY", "$REGISTRY_CREDENTIALS") {
                        docker.image("$IMAGE_NAME:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Use kubectl or Helm to apply the Kubernetes deployment manifests
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
