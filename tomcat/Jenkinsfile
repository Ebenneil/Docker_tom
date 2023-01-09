pipeline {
    agent {label 'slave'}
    stages {
        stage ('My Build') { 
            steps {
              sh 'mvn package'
              sh 'pwd'
              sh 'whoami'
              sh 'scp -R /home/slave/workspace/job1/target/hello-world-war-1.0.0.war build@172.31.34.237:/opt/tomcat/webapps/'
            }
        }
        stage ('My deploy') { 
        agent {label 'slavebuild'}
            steps {
              sh 'pwd'
              sh 'whoami'
              sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
              sh 'sleep 3'
              sh 'sudo sh /opt/tomcat/bin/startup.sh'
            }
        }
    }
}

