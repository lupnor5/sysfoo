pipeline{

    agent any

    tools{
       maven 'Maven 3.9.6' 
    }
    

    stages{
        stage('compile'){
            steps{
                echo 'compiling sysfoo app ...'
                sh 'mvn compile'
            }
        }
        stage('test'){
            steps{
                echo 'runing unit tests ...'
                sh 'mvn clean test'
            }
        }
        stage('package'){
            steps{
                echo 'packing sysfoo app ...'
                sh 'mvn package -DskipTests'
            }
        }
    }
    
    post{
        always{
            echo 'this pipeline has completed...'
        }
        
    }
    
}
