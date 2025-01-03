pipeline {
    agent any

    environment {
        IMAGE_NAME = 'web-calculator'
        REGISTRY = 'docker.io'
        REPOSITORY = 'mohan201/web-calculator'
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
                    // Build the Docker image
                    sh 'docker build -t $REGISTRY/$REPOSITORY:$BUILD_NUMBER .'
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    // Test the Docker image
                    sh 'docker run -d -p 8081:80 $REGISTRY/$REPOSITORY:$BUILD_NUMBER'
                    // You can add automated tests here, e.g., curl or selenium
                    sleep(5) // Wait for the container to start
                    sh 'curl -f http://localhost:8081 || exit 1'
                }
            }
        }

        stage('Push to Docker Registry') {
            steps {
                script {
                    // Push the image to Docker Hub or any registry
                    sh 'docker push $REGISTRY/$REPOSITORY:$BUILD_NUMBER'
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                script {
                    // You can deploy the container to a server (e.g., using Docker Compose, Kubernetes, or directly)
                    echo 'Deploying the app to production...'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after execution
        }
    }
}
