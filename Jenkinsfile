pipeline {
    agent any
    
    stages {
     // stage to verify sonar-scanner 
     stage('sonar-scanner-verify') {
            steps {
                echo 'checking version'
                // bat or pwsh
                bat 'sonar-scanner --version'
            }
        }
    }
}