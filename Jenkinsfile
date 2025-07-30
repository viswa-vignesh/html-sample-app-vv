pipeline {
    agent any
    environment {
        REPO_NAME = "https://github.com/viswa-vignesh/html-sample-app-vv.git"
        BRANCH_NAME = "master"
        SONAR_HOME = 'C:\\Users\\Administrator\\Documents\\tools\\sonar-scanner\\bin'
        SONAR_TOKEN = credentials('VV-Day3-Project-Token')
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
        //stage 3
        stage('sast with sonar scanner') {
            steps {
                echo 'sast '
                // execute sonar cmd
                //bat 'sonar-scanner.bat -D"sonar.projectKey=VV-Day3-Project" -D"sonar.sources=." -D"sonar.host.url=http://13.203.151.240:9000" -D"sonar.token='${SONAR_TOKEN}'"'
                bat """
                 %SONAR_HOME%\\sonar-scanner \
                -Dsonar.projectKey=VV-Day3-Project \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://13.203.151.240:9000 \
                -Dsonar.token=${SONAR_TOKEN}
                """
            }
        }
    }
}