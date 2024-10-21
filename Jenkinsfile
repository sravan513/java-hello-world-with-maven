pipeline{
    agent any
      stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '4afa7c45-845d-4a33-a81b-debf490a13e3', url: 'https://github.com/sravan513/java-hello-world-with-maven.git']]])
            }
        }
        stage('build'){
            steps{
               bat 'mvn package'
            }
        }
    }
}
