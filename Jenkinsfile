pipeline {
    agent any
    tools {
      terraform 'terraform1'
    }
    stages {
        stage('scm checkout') {
            steps {
                git 'https://github.com/rsivaseshu/terraform-practice.git'
            }
        }
        
        stage('terraform init'){
            steps {
                dir('data-modules/s3/'){
                    sh 'terraform init'
                }
            }
        }
        stage('terraform validate'){
            steps {
                dir('data-modules/s3/'){
                    sh 'terraform validate'
                }
            }
        }

        stage('terraform apply'){
            steps {
                dir('data-modules/s3/'){
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}
