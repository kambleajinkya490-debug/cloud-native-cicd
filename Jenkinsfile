pipeline {
    agent any

    environment {
        IMAGE = "ak00721/cloudnative-backend:latest"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/kambleajinkya490-debug/cloud-native-cicd.git'
            }
        }

        stage('Build Jar') {
            steps {
                sh 'cd backend && mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE ./backend'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $IMAGE
                    '''
                }
            }
        }

        stage('Deploy to EKS') {
    steps {
        sh '''
        export AWS_PROFILE=default
        export KUBECONFIG=/var/lib/jenkins/.kube/config

        kubectl apply -f k8s/
        '''
    }
}
    }
}
