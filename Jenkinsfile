pipeline{
   agent any
   environment {
        AWS_DEFAULT_REGION    = 'us-west-2'
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') 

    }
   stages {
     stage('list') {
       steps {
         sh 'ls'
       }
     }
     stage('terraform init') {
       steps {
         sh 'terraform init'
       }
     }

     stage('terraform apply') {
       steps {
         sh 'terraform apply -auto-approve'
       }
     }
     
   }
}
