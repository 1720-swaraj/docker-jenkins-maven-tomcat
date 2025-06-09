pipeline {
    agent {
        label 'built-in'
    }
    tools {
        maven 'install-maven'
    }
    stages {
        stage('git-checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('env-variables') {
            steps {
                script {
                    env.DOCKER_CONTAINER = "tomcat-${env.BRANCH_NAME}"
                    env.DOCKER_IMAGE = "swaraj9/login_app:${env.BUILD_NUMBER}"
                }
            }
        }
        stage('build-project') {
            steps {
                    sh 'mvn clean install'
            }
        }
        stage('docker-build') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }
        stage('docker-push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub_credentials', url:'') {
                        docker.image(env.DOCKER_IMAGE).push()
                    }
                }
            }
        }
        stage('docker-run') {
            steps {
                script {
                    sh "docker run -itdp 8080:8080 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
