
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

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/aws-instance-first-script ; terraform init -input=false'
                sh 'pwd;cd terraform/aws-instance-first-script ; terraform workspace new ${environment}'
                sh 'pwd;cd terraform/aws-instance-first-script ; terraform workspace select ${environment}'
                sh "pwd;cd terraform/aws-instance-first-script ;terraform plan -input=false -out tfplan "
                sh 'pwd;cd terraform/aws-instance-first-script ;terraform show -no-color tfplan > tfplan.txt'
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
                    def plan = readFile 'terraform/aws-instance-first-script/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/aws-instance-first-script ; terraform apply -input=false tfplan"
            }
        }
    }

}


