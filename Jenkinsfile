pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                dir('ci-cd-with-jenkins-app') {
                    sh 'mvn clean verify'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                dir('ci-cd-with-jenkins-app') {
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=ci-cd-with-jenkins'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ci-cd-with-jenkins-app:1.0 .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker tag ci-cd-with-jenkins-app:1.0 "$DOCKER_USERNAME/ci-cd-with-jenkins:1.0"
                        docker push "$DOCKER_USERNAME/ci-cd-with-jenkins:1.0"
                        docker logout
                    '''
                }
            }
        }
    }
}
