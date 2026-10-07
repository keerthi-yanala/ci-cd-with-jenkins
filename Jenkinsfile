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
                        sh 'mvn sonar:sonar -Dsonar.projectKey=ci-cd-with-jenkins'
                    }
                }
            }
        }
    }
}
