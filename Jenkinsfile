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

        stage('Debug') {
            steps {
                script {
                    def dockerVersion = sh(script: 'docker --version', returnStatus: true).toString().trim()
                    echo "Docker Version: ${dockerVersion}"
                    def loginCmd = "docker login -u raptor1702 -p manan@202 docker.io"
                    def loginResult = sh(script: loginCmd, returnStatus: true)
                    if (loginResult != 0) {
                        error "Docker login failed"
                    }
                }
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
                    // Push the Docker image to the Docker Hub repository
                    def dockerImage = docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                    dockerImage.push()
                }
            }
        }


        //stage('Deploy to Kubernetes') {
            //steps {
                // Use kubectl or Helm to apply the Kubernetes deployment manifests
                //sh 'kubectl apply -f deployment.yaml'
            //}
        //}
    }
}
