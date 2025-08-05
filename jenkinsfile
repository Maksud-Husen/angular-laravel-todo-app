pipeline{
    agent any

    stages {
         
        stage("Remove old project") {
            steps {
                echo "Removing old project if exists"
            }
            steps {
                script {
                    sh '''if [ -d "angular-laravel-todo-app" ]; then
                        rm -rf angular-laravel-todo-app
                    fi'''
                }
            }
        } 

        stage("clone project") {
            steps {
                echo "cloning project"
            }
            steps {
                script {
                    sh '''git clone https://github.com/Maksud-Husen/angular-laravel-todo-app.git'''
                }
            }
        }   

        stage("Run ansible"){
            steps {
                echo "Running ansible playbook"
            }
            steps {
                    sh '''cd angular-laravel-todo-app && 
                        ansible-playbook -i inventory.ini state.yml'''
                    }       
        }

    }    
}