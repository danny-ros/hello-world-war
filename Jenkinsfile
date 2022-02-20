pipeline {
  agent any
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/danny-ros/hello-world-war.git', branch: 'dev', changelog: true)
      }
    }

    stage('compile') {
      steps {
        sh 'mvn compile'
      }
    }
   stage('docker tag push') {
      steps {
     
withDockerRegistry(credentialsId: 'nexus', url: 'http://127.0.0.1:8123/repository/docker-hosted/') {
sh '''docker tag helloworld:$BUILD_ID 127.0.0.1:8123/repository/docker-hosted/helloworld:$BUILD_ID

               docker push 127.0.0.1:8123/repository/docker-hosted/helloworld:$BUILD_ID'''
}
      }
    }
}
