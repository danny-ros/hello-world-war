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
#   stage('sonarqube') {
#     steps {
#       sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=danny-ros_hello-world-war -Dsonar.login=f005147983107de2273f61b4fdfdab8cdf6f5986'''
#      }
#    }
  }
}
