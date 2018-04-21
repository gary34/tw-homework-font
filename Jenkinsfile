pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
            image 'node'
            reuseNode true
        }
      }
      steps {
        sh 'npm install --loglevel=error'
        sh 'npm run build --loglevel=error' 
      }
    }
    stage('Test') {
      steps {
        echo 'Ok'
      }
    }
    stage('Package') {
        steps {
            sh 'mkdir -p packages'
            sh 'v=$(git rev-parse --short HEAD) tar -czf packages/font-${v}.tgz dist'
            echo 'Ok'
        }
    }
    stage('Deploy Development') {
      when {
        branch 'develop'
      }
      steps {
        sh 'echo \'deploy to development\''
      }
    }
    stage('Deploy Production') {
      when {
        branch 'master'
      }
      steps {
        sh 'echo \'deploy to production\''
      }
    }
  }
  post {
    success {
        mail to: 'pugood@126.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Something is wrong with ${env.BUILD_URL}"
    }
}
}
