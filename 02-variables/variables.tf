variable "ami_id" {
  type        = string  #type is optional
  default     = "ami-09c813fb71547fc4f"
  description = "This is RHEL9 AMI ID"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {
        Project = "expense"
        Component = "backend"
        Environment = "dev"
        Name = "expense-backend-dev"
    }
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "cidr_blocks" {
    type = list(string) #list
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map
    default = {
        Name = "expense-backend-dev"
    }
}

/* 
--Terraform Variables Specific Order of Precedence--

1. command line   # terraform apply -var "<var-name>=<var-value>"
2. tfvars         # .tfvars file
3. env var        # export TF_VAR_<var-name>="<var-value>" ,# unset TF_VAR_<var-name>
4. default values # variables.tf
5. user prompt    # if you not provide value in any place it will ask in prompt level */  