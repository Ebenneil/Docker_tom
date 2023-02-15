pipeline {
    agent {label 'build'}
    stages {
        stage('my Build') {
            steps {
                sh 'docker build -t tomcat_build:${BUILD_NUMBER} .'
                sh 'helm package ./helm/tomcat --version=${BUILD_NUMBER}'
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_NUMBER}"
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                                 
                sh 'curl -uebenneelpinto@gmail.com:Neil12345! -T tomcat-${BUILD_NUMBER}.tgz \"https://ebenneilpinto.jfrog.io/artifactory/helm/tomcat-${BUILD_NUMBER}.tgz\"'
                }
            }
        } 
        stage( 'my deploy' ) {
        agent {label 'deploy'} 
            steps {
               sh 'helm repo add helm https://ebenneilpinto.jfrog.io/artifactory/api/helm/helm --username ebenneelpinto@gmail.com --password Neil12345!'
               sh 'helm repo update'
               sh 'helm repo list'
               sh 'helm upgrade --install mytomcat helm/tomcat --version=${BUILD_NUMBER} --set selector_matchlabels=tomcat --set deployment_name=tomcat --set replicas=2 --set registry_name=ebenneelpinto --set docker_repo_name=tomcat --set image_tag=${BUILD_NUMBER} --set port_name=tomcat --set target_port=8080 --set port=8080 --set favorite.drink=coffee --set favorite.food=pizza'
            }
        }    
    } 
}

