pipeline {
  agent any
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/danny-ros/hello-world-war.git', branch: 'dev', changelog: true)
      }
    }
    stage('Clean before clone') {
        steps {
          cleanWs()
      }
    }
    stage('Maven Compile') {
      steps {
        sh 'mvn compile'
      }
    }
    stage('SonarCloud') {
      steps {
        sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=danny-ros_hello-world-war -Dsonar.login=0681c18563298f4f69fc1eb7b253435a77567f0c'''
      }
    }
   // Building Docker images
    stage('Docker Build') {
      steps {
        sh 'docker build -t helloworld:$BUILD_ID .'
      }
    }
    // Uploading Docker images into Nexus Registry
    stage('Tag and Push to Nexus') {
      steps {
            withDockerRegistry(credentialsId: 'Nexus' , url: 'http://localhost:8123/repository/docker-hosted/') {
        sh '''docker tag helloworld:$BUILD_ID localhost:8123/repository/docker-hosted/helloworld:$BUILD_ID
               docker push localhost:8123/repository/docker-hosted/helloworld:$BUILD_ID'''
              }
      }
    post {
     success {
        slackSend(message: "Build deployed successfully - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'danny-dev', color: '#008000')
     }

     failure {
          slackSend(message: " Build failed - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'danny-dev', color: '#FF0000')
        }
      }
    }
  }
}
