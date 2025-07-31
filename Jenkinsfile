pipeline {
    agent any
    environment {
        REPO_NAME = "https://github.com/viswa-vignesh/html-sample-app-vv.git"
        BRANCH_NAME = "master"
        SONAR_HOME = 'C:\\Users\\Administrator\\Documents\\tools\\sonar-scanner\\bin'
        SONAR_TOKEN = credentials('VV-Day3-Project-Token')
        SONAR_PROJECT_KEY = 'VV-Day3-Project'
        SONAR_SERVER_NAME = 'VV-SonarQube-Server'
        DOCKER_CREDS = 'VV-dockerhub'
        IMAGE_NAME = "vigneshviswanathan1145/vv-app-iis-day3"
        IMAGE_TAG = "codev1"
        TRIVY_REPORT = "trivy-vv.txt"
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
                //new approach
                script {
                    withSonarQubeEnv("${SONAR_SERVER_NAME}") {
                        bat """
                        %SONAR_HOME%\\sonar-scanner \
                        -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=${SONAR_HOST_URL} \
                        -Dsonar.token=${SONAR_TOKEN}
                        """
                    }
                }
            }
        }
        //stage 4
        stage('building docekr image'){
            steps{
                echo 'Starting docker image process'
                // use script to use docker plugin
                script {
                    //def imageName = "vigneshviswanathan1145/vv-app-iis-day3"
                    //def imageTag = "codev1"
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}",".")
                }

                //verify
                bat 'docker images  |  findstr vv'

            }
        }
        //stage 5
        stage('trivy scan'){
            steps {
                echo 'scanning using trivy'
                bat """
                trivy image ${IMAGE_NAME}:${IMAGE_TAG} --severity HIGH,CRITICAL --format table --report summary -o ${TRIVY_REPORT}
                findstr /I "HIGH CRITICAL" ${TRIVY_REPORT} >null
                if %errorlevel% == 0 (
                echo [ERROR] HIGH or ciritical found 
                exit /b 1
                )
                else (
                echo no error found 
                )
                """
            }
        }


        //stage 6
        // stage('pushing docker image'){
        //     steps{
        //         echo 'pushing docker image to dockerhub'
        //         // use script to use docker plugin
        //         script {
        //             //def imageName = "vigneshviswanathan1145/vv-app-iis-day3"
        //             //def imageTag = "codev1"
        //             def hubCreds = "${DOCKER_CREDS}"
        //             //calling jenkins plugin docker push
        //             docker.withRegistry('https://registry.hub.docker.com', hubCreds) {
        //                 docker.image(${IMAGE_NAME} + ":" + ${IMAGE_TAG}).push()
        //             }
                    
        //         }

        //     }
        // }
    }
}