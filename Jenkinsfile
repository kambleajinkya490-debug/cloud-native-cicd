pipeline {
    agent any

    environment {
        IMAGE = "DOCKERHUB_USERNAME/cloudnative-backend:latest"
    }

    stages {

        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'cd backend && mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE ./backend'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE'
            }
        }

        stage('Deploy EKS') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
