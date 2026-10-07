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
    }
}
