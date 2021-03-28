pipeline {
    agent {
        label 'buildah'
    }

    stages {
        stage('Build Image') {
            steps {
                sh 'ls -lsah'
                sh 'buildah info'
                sh 'buildah bud -t hmland && buildah inspect hmland'
                sh 'buildah images; buildah containers'
            }
        }
    }
}

