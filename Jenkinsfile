pipeline {
    agent any
    
    stages {
     // stage to verify sonar-scanner 
     stage('sonar-scanner-verify') {
            steps {
                echo 'checking sonar scanner version'
                // bat
                bat 'sonar-scanner --version'
                echo 'checking java version'
                bat 'java --version'
                echo 'checking docker version'
                bat 'docker -v'
            }
        }
    }
}