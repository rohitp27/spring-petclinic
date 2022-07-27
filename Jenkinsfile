pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Database engine is ${SONAR_HOST_URL}"' 
            }
        }
        stage('SonarQube') { 
            steps {
                sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=spring-petclinic -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_TOKEN' 
            }
        }
    }
}
