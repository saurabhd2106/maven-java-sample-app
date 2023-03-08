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

               
             withSonarQubeEnv() {
                sh "mvn clean verify sonar:sonar -Dsonar.projectKey=petclinic-via-plugin"
                }

            }
            
        
            }
        }
         stage('Publish Test Result') {
            steps {
               junit "*/*/Test-*.xml"
            }
        }
        

       stage('Quality Gate') {
           steps {
               waitForQualityGate abortPipeline: true
           }
       }
    }
}
