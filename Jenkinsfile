pipeline {
    agent {label 'b'}
    stages {
        stage('my Build') {
            steps {
                sh 'docker build -t tomcat_build:${BUILD_NUMBER} .'
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_NUMBER}"
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                    sh "docker login -u ${env.dockerHubUSER} -p ${env.dockerHubPassword}"
                sh 'docker tag tomcat_build:${BUILD_NUMBER} ebenneelpinto/mytom:${BUILD_NUMBER}'
                sh 'docker push ebenneelpinto/mytom:${BUILD_NUMBER}'
                }
            }
        } 
        stage( 'my deploy' ) {
        agent {label 's'} 
            steps {
               sh 'docker pull ebenneelpinto/mytom:${BUILD_NUMBER}'
               sh 'docker rm -f mytomcat'
               sh 'docker run -d -p 8080:8080 --name mytomcat ebenneelpinto/mytom:${BUILD_NUMBER}'
            }
        }    
    } 
}

