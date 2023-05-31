pipeline {
  agent any
   stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/dsirine/jenkins-pipeline-deploy-to-eks.git'
      }
    }
    stage('Verify tooling') {
      steps {
        sh '''
          docker version
          docker info
          curl --version
          aws --version
          eksctl version
          kubectl version --client --output=yaml
        '''  
      }
    }
    stage ('Prune docker data'){
      steps  {
        sh 'docker system prune -a --volumes -f'
      }
    }
    stage('Deploy to AWS') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'petclinic'
        ]]) 
        {
          sh "terraform init"
          sh "terraform apply -auto-approve"
        } 
      }
    }
    stage ('Check the cluster'){
      steps  {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'petclinic'
        ]])
        {
          sh "aws eks update-kubeconfig --name myapp-eks-cluster"
          sh "run_kubernetes.sh"
        }
      }
    } 

  }
  post {
    always {
       sh 'curl http://localhost:8761'
    }
  }
}