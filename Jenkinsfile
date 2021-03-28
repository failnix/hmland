pipeline {
    agent {
        label 'buildah'
    }

    stages {
        stage('Build Image') {
            steps {
                sh 'ls -lsah'
                sh 'buildah bud -t hmland'
            }
        }
    }
}

