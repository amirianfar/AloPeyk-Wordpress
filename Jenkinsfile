pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '2'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('amirianfar')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t miladwordpress/wordpress:1.0  .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push amirianfar/miladmain'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker-compose.yaml up'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

