pipeline {
  agent any
  stages {
    stage('compile') {
      steps {
        echo 'compiling sysfoo app ...'
        sh 'mvn compile'
      }
    }

    stage('test') {
      steps {
        echo 'runing unit tests ...'
        sh 'mvn clean test'
      }
    }

    stage('package') {
      steps {
        echo 'packing sysfoo app ...'
        sh '''# Truncate the GIT_COMMIT to the first 7 characters
GIT_SHORT_COMMIT=$(echo $GIT_COMMIT | cut -c 1-7)
# Set the version using Maven
mvn versions:set -DnewVersion="$GIT_SHORT_COMMIT"
mvn versions:commit'''
        sh 'mvn package -DskipTests'
        archiveArtifacts '**/target/*.jar'
      }
    }

  }
  tools {
    maven 'Maven 3.9.6'
  }
  post {
    always {
      echo 'this pipeline has completed...'
    }

  }
}