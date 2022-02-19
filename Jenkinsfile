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

  }
}
