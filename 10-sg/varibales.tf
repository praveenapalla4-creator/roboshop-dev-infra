variable "project_name" {
    default="roboshop"
}
variable "environment" {
    default="dev"
}


variable "sg_names"{
    default=[
        #databases
        "mongodb", "redis","mysql","rabbitymq",
        #backend
        "catalogue","user","cart","shipping","payment",
        #frontend
        "frontend",
        #bastion
        "bastion",
        #frontned load balancer this is the security group for craeting load balancer
        "frontend_alb",
        "backend_alb"]
}