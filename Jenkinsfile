pipeline {
    agent any

    stages {
        

        stage('Build') {
            steps {
             sh  "mvn clean compile"
            }
        }

        stage('Sonar Scan') {
            steps {
            script {

                def mvn = tool 'Default Maven';
             withSonarQubeEnv() {
                sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=petclinic-via-plugin"
                }

            }
            
        
            }
        }
    }
}
