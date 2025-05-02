#data "<type>" "<name>"
data "aws_ami" "joindevops" {
    most_recent      = true # to get latest
    owners           = ["973714476881"]
    # we use filters upto to fetch a single piece of data
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
  default = true
}

# output blocks are used to print the information. it will be used in module development too.
output  "ami_id" {
  value       = data.aws_ami.joindevops.id
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}