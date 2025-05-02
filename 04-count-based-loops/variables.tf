variable "instances" {
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    #default = "<zone_id>"
}

variable "domain_name" {
    #default = "<domain_name>"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
    }
}