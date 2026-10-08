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
    }
}
