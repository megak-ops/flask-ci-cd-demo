pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'mastern',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/megak-ops/flask-ci-cd-demo.git'
            }
        }

        stage('Install Poetry') {
            steps {
                sh 'curl -sSL https://install.python-poetry.org | python3 -'
                sh 'export PATH="$HOME/.local/bin:$PATH"'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '$HOME/.local/bin/poetry install'
            }
        }

        stage('Run Tests') {
            steps {
                sh '$HOME/.local/bin/poetry run pytest || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-ci-demo .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-app flask-ci-demo || true'
            }
        }
    }
}
