pipeline {
    agent any

    tools {
        terraform 'Terraform'
    }

    stages {
        stage('Git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rambaris/brief14']])
            }
            
        }
        
        stage('Build and push') {
            steps {
                sh "docker build -t rambaris/myapppython ."  
                sh "docker login -u rambaris -p dckr_pat_IkFzG-WnVb40T55x0GrA8R7x87A"   
                sh "docker push rambaris/myapppython" 
            }
        }

        stage('Credentials') {
            steps{
                azureCLI commands: [[exportVariablesString: '', script: 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID']], principalCredentialId: 'azure'
            }
            
        }
        stage('Terraform Init Stage') {
            steps {
                    sh "cd staging-env && terraform init"
            }
        }

        stage('Terraform plan Stage') {
            steps{
                sh "cd staging-env && terraform plan"
            }
        }

        stage('Terraform apply Stage') {
            steps {
                sh "cd staging-env && terraform apply -auto-approve"
            }
        }

        stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }

        stage('Terraform Init Prod') {
            steps {
                    sh "cd prod-env && terraform init"
            }
        }

        stage('Terraform plan Prod') {
            steps{
                sh "cd prod-env && terraform plan"
            }
        }
        

        stage('Terraform apply Prod') {
            steps {
                sh "cd prod-env && terraform apply -auto-approve"
            }
        }
        

        
    }
}

