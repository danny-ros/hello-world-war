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
        sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=iditasias_hello-world-war -Dsonar.login=55a3b6e2f5ee5c7a1ba18613c086cfd30d1cae0b
'''
      }
    }
  }
}
