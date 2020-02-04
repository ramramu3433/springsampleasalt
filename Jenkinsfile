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
                
              sh('kubectl apply -f servicedef.yaml')  
   }
        }
 stage('smoke-test')
        {
            steps
            {   
                sh ( "echo PORT_APP=$(kubectl get svc | grep app | awk '{print $3}' | awk -F':' '{print $2}')")
                curl http://localhost:$PORT_APP
            }
        }
    }
   }