#!/usr/bin/env groovy
pipeline {
    agent any
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                        credentialsId: 'petclinic'
                        ]])
                        dir('terraform') {
                            sh "terraform init"
                            sh "terraform apply -auto-approve"
                        }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                        credentialsId: 'petclinic'
                        ]])
                        dir('kubernetes') {
                            sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                            sh "run_kubernetes.sh"

                        }
                }
            }
        }
    }
}