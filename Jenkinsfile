pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('amirianfar')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t amirianfar/miladmain  .'
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
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
