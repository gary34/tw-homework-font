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
            args '-u root:root'
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
            // sh 'if [ ! -d ansible ]; then git clone https://gitee.com/gary34/tw-homework-ansible.git ansible; else cd ansible && git pull origin master; fi'
            sh 'rm -rf tw-homework-ansible-master && wget https://github.com/gary34/tw-homework-ansible/archive/master.zip && unzip master.zip'
            sh 'cp packages/font-${CODE_VERSION}.tgz tw-homework-ansible-master/roles/front/files/'
        }
    }
    stage('Deploy to Development') {
      when {
        branch 'develop'
      }
      agent {
        docker {
            image 'williamyeh/ansible:alpine3'
        }
      }
      steps {
        sh 'cd ansible && ansible-playbook --tags "setup,front" -i hosts/development site.yml'
      }
    }
    stage('Deploy to Production') {
      when {
        branch 'master'
      }
    //   agent {
    //     docker {
    //         image 'williamyeh/ansible:alpine3'
    //     }
    //   }
      steps {
        // sh 'echo $(pwd)'
        sh 'cd tw-homework-ansible-master && chmod 600 id_rsa-ansible && ansible-playbook --tags "setup,front" -i hosts/production site.yml'
      }
    }
  }
  post {
    success {
        sh "echo to notify some body"
    }
}
}
