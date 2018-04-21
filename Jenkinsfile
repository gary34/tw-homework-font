pipeline {
  agent any
  environment {
      CODE_VERSION = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
  }
  stages {
    stage('Build') {
      agent {
        docker {
            image 'node'
            reuseNode true
        }
      }
      steps {
        script {
            if (env.BRANCH_NAME == 'master'){
                environment name: 'API_URL', value: 'http://xxxxxxx.x.xx'
            }
        }
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
            sh 'tar -czf packages/font-${CODE_VERSION}.tgz dist'
            echo 'Ok'
        }
    }
    stage('Prepare Deploy') {
        steps {
            sh 'mkdir -p ansible'
            sh 'if [ ! -d ansible ]; then git clone https://gitee.com/gary34/tw-homework-ansible.git ansible else git pull origin master fi'
            sh 'cp packages/font-${CODE_VERSION}.tgz ansible/roles/front/files/'
        }
    }
    stage('Deploy to Development') {
      when {
        branch 'develop'
      }
      steps {
        sh 'echo \'deploy to development\''
      }
    }
    stage('Deploy to Production') {
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
        sh "echo to notify some body"
    }
}
}
