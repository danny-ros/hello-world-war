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
    stage('sonarqube') {
      steps {
        sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=admin_hello-world-war -Dsonar.login=de12ef46116c13a7bcae7eb232057c7c8ccdbaa4
'''
      }
    }
  }
}
