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

       stage('Quality Gate') {
           steps {
               waitForQualityGate abortPipeline: true
           }

          
       }

       
    }
}
