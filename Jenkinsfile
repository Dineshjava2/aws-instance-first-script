
pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


   agent  any
        
    stages {
        stage('checkout') {
            steps {
                 checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'GIT_hub', url: 'https://github.com/Dineshjava2/aws-instance-first-script']])
            }
        }

        stage('terraform Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('terraform Apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }

}


