pipeline {
    agent any

    stages {
        stage("Remove old project") {
            steps {
                echo "Removing old project if exists"
                script {
                    sh '''
                        rm -rf angular-laravel-todo-app'''
                }
            }
        }

        stage("Clone project") {
            steps {
                echo "Cloning project"
                script {
                    sh 'git clone -b with-ansible https://github.com/Maksud-Husen/angular-laravel-todo-app.git'
                }
            }
        }

        stage("Run Ansible") {
            steps {
                echo "Running ansible playbook"
                script {
                    sh '''cd angular-laravel-todo-app
                    echo "Contents of repo:"
                    ls -la
                    echo "Running playbook..."
                    ansible-playbook -i inventory.ini state.yml
                    '''
                }
            }
        }
    }
}
