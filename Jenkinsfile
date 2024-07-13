pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub-ajith')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
	    git branch: 'main', url: 'https://github.com/Ajithprince/node-deployment.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t ajithprince/nodeapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push ajithprince/nodeapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
