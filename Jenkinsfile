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

           post {
                always {
                // One or more steps need to be included within each condition's block.
      
                    steps {
                            junit "**/target/surefire-reports/TEST-*.xml"
                            }
                }
            }
       }

       
    }
}
