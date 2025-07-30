pipeline {
    agent any
    environment {
        REPO_NAME = "https://github.com/viswa-vignesh/html-sample-app-vv.git"
        BRANCH_NAME = "master"
    }

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
        //stage 2
        stage('git checkout') {
            steps {
                echo 'checking out git repo'
                // execute git cmd from jenkins
                git url: "${REPO_NAME}", branch: "${BRANCH_NAME}"
            }
        }
    }
}