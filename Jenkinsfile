pipeline {
  agent {
    label 'java'
  }

  triggers { 
    pollSCM('* * * * *') 
  }
  
  stages {
    stage ('git_checkout') {
        steps {
             git branch: 'main', url: 'https://github.com/Raj-Gandhi-1992/spring-petclinic-advance.git'
        }
  }
    stage ('docker_build') {
        steps {
            sh 'docker build -t test-java:latest .'
        }
    }
    stage ('docker_run') {
        steps {
            sh 'docker run -d -P test-java:latest'
        }
    }
 }

 post {
    success {
        echo "java app deployment with docker is successful"
    }
    failure {
        echo "deployment failed, check code"
    }
 }
}