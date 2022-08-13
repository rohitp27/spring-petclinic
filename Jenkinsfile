pipeline {
    agent any
    stages {
        stage('Print stuff') { 
            steps {
                sh "ansible all -m shell -a 'nohup java -jar /home/vagrant/spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar > /home/vagrant/nohup.out &' -i inventories/dev/host" 
            }
        }
    }
}