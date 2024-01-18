pipeline {
    agent any 

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('SCM Checkout') {
            steps {
                sh 'rm -rf react_demo || true'  // Remove existing directory if it exists
                sh 'git clone https://github.com/majesticteam23/demo.git'
                echo 'test1'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'test2'
        script {
            // Increase the timeout value (e.g., from 10 minutes to 20 minutes)
            timeout(time: 20, unit: 'MINUTES') {
                docker.build("majesticteam47/react_demo:latest")
            }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                    }
                    echo 'test3'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push majesticteam47/react_demo:latest .'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}