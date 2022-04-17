# terraform-k8s-aws

# To initialize the project:
    
    1) With the "terraform" code block commented on "./backend/main.tf":

        terraform chdir=backend init

        terraform chdir=backend apply
    
    2) After the initialization of the backend uncomment the
        "terraform" code block on "./backend/main.tf"

    3) To apply the backend configuration:

        terraform chdir=backend init
    
    4) To initialize the EC2 instance, eip and the rest of the components:

        terraform init

    5) To deploy the EC2 instance, eip and the rest of the components:

        terraform apply
        
