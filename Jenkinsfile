pipeline {
    agent any
    
    stages {
         stage('checkout')
             {
                 steps
                 {
                 checkout scm
                 }
}
      
        stage('build-docker')
        {
            steps
            {
                sh('sudo docker build . -t app1:$BUILD_ID')
                             }
                             }
      

        stage ('push artifacts')
       {
           steps 
              {
               sh ('docker login --username=janramu94 --password=admin123A')
               sh ('docker tag app1:$BUILD_ID janramu94/app1:$BUILD_ID')
               sh  ('docker push janramu94/app1:$BUILD_ID')
   }
}
  stage('deploy_docker')
        {
            steps
            {
                
                
   }
        }
 stage('smoke-test')
        {
            steps
            {
                curl localhost:90/app1
            }
        }
    }
   }