pipeline {
    agent {
        label 'built-in'
    }
    tools {
        maven 'install-maven'
    }
    environment {
        DOCKER_CONTAINER="tomcat-${env.BRANCH_NAME}"
        DOCKER_IMAGE="swaraj9/LoginApp:${env.BUILD_NUMBER}"

    }
    stages {
        stage('git-checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('build-project') {
            steps {
                    sh 'sudo mvn clean install'
            }
        }
        stage('docker-build') {
            steps {
                docker.build("${env.DOCKER_IMAGE}")
            }
        }
        stage('docker-push') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub_credentials', url:'') {
                    dockerImage.push()
                }
            }
        }
        stage('docker-run'){
            steps{
                sh 'sudo docker run -itdp 8080:8080 --name \$DOCKER_CONTAINER \$DOCKER_IMAGE'
            }
        }
    }
}
