# # Frontend accepting traffic from frontend alb
# resource "aws_security_group_rule" "frontned_fronetnd_alb" {
#   security_group_id = module.sg[9].sg_id #frontned secuirty groiup id
#   source_security_group_id= module.sg[11].sg_id # frontned load balancer id
#    type              = "ingress"
#   from_port         = 80
#   protocol            = "tcp"
#   to_port           = 80
# }

## Mongodb Sg Rules####
resource "aws_security_group_rule" "mongodb_bastion" {
  security_group_id = local.mongodb_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  security_group_id = local.mongodb_sg_id
  source_security_group_id= local.catalogue_sg_id # catalogue nundi mongodb ki connect avthudnhi
   type              = "ingress"
  from_port         = 27017
  protocol            = "tcp"
  to_port           = 27017
}

resource "aws_security_group_rule" "mongodb_user" {
  security_group_id = local.mongodb_sg_id
  source_security_group_id= local.user_sg_id # catalogue nundi mongodb ki connect avthudnhi
   type              = "ingress"
  from_port         = 27017
  protocol            = "tcp"
  to_port           = 27017
}

## Redis Sg Rules####
#reddis accepting connections from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {
  security_group_id = local.redis_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
#reddis accepting connections from user on port 6379
resource "aws_security_group_rule" "redis_user" {
  security_group_id = local.redis_sg_id
  source_security_group_id= local.user_sg_id 
   type              = "ingress"
  from_port         = 6379
  protocol            = "tcp"
  to_port           = 6379
}
#reddis accepting connections from cart on port 6379
resource "aws_security_group_rule" "redis_cart" {
  security_group_id = local.redis_sg_id
  source_security_group_id= local.cart_sg_id 
   type              = "ingress"
  from_port         = 6379
  protocol            = "tcp"
  to_port           = 6379
}

## Mysql Sg Rules####
resource "aws_security_group_rule" "mysql_bastion" {
  security_group_id = local.mysql_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mysql_shipping" {
  security_group_id = local.mysql_sg_id
  source_security_group_id= local.shipping_sg_id # catalogue nundi mongodb ki connect avthudnhi
   type              = "ingress"
  from_port         = 3306
  protocol            = "tcp"
  to_port           = 3306
}


## Mongodb Sg Rules####Rabbitmq
resource "aws_security_group_rule" "rabbitmq_bastion" {
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id= local.payment_sg_id # catalogue nundi mongodb ki connect avthudnhi
   type              = "ingress"
  from_port         = 5672
  protocol            = "tcp"
  to_port           = 5672
}


## Catalogue Sg Rules####
resource "aws_security_group_rule" "catalogue_bastion" {
  security_group_id = local.catalogue_sg_id
  source_security_group_id= local.bastion_sg_id #bastion tho catalogue connect avuthunna
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "catalogue_backend_alb" {
  security_group_id = local.catalogue_sg_id
  source_security_group_id= local.backend_alb_sg_id # catalogue nundi mongodb ki connect avthudnhi
   type              = "ingress"
  from_port         = 8080
  protocol            = "tcp"
  to_port           = 8080
}

## User Sg Rules####
resource "aws_security_group_rule" "user_bastion" {
  security_group_id = local.user_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "user_backend_alb" {
  security_group_id = local.user_sg_id
  source_security_group_id= local.backend_alb_sg_id
   type              = "ingress"
  from_port         = 8080
  protocol            = "tcp"
  to_port           = 8080
}

## Cart Sg Rules####
resource "aws_security_group_rule" "cart_bastion" {
  security_group_id = local.cart_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "cart_backend_alb" {
  security_group_id = local.cart_sg_id
  source_security_group_id= local.backend_alb_sg_id
   type              = "ingress"
  from_port         = 8080
  protocol            = "tcp"
  to_port           = 8080
}




## Shipping Sg Rules####
resource "aws_security_group_rule" "shipping_bastion" {
  security_group_id = local.shipping_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "shipping_backend_alb" {
  security_group_id = local.shipping_sg_id
  source_security_group_id= local.backend_alb_sg_id
   type              = "ingress"
  from_port         = 8080
  protocol            = "tcp"
  to_port           = 8080
}


## Payment Sg Rules####
resource "aws_security_group_rule" "payment_bastion" {
  security_group_id = local.payment_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "payment_backend_alb" {
  security_group_id = local.payment_sg_id
  source_security_group_id= local.backend_alb_sg_id
   type              = "ingress"
  from_port         = 8080
  protocol            = "tcp"
  to_port           = 8080
}


## Backedn ALB Sg Rules####
resource "aws_security_group_rule" "backend_alb_bastion" {
  security_group_id = local.backend_alb_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}
resource "aws_security_group_rule" "backend_alb_frontend" {
  security_group_id = local.backend_alb_sg_id
  source_security_group_id= local.frontend_alb_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}
resource "aws_security_group_rule" "backend_alb_cart" {
  security_group_id = local.backend_alb_sg_id
  source_security_group_id= local.cart_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}
resource "aws_security_group_rule" "backend_alb_shipping" {
  security_group_id = local.backend_alb_sg_id
  source_security_group_id= local.shipping_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}
resource "aws_security_group_rule" "backend_alb_payment" {
  security_group_id = local.backend_alb_sg_id
  source_security_group_id= local.payment_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}

## Frontned  Sg Rules####
resource "aws_security_group_rule" "frontned_fronetnd_alb" {
  security_group_id = local.frontend_sg_id
  source_security_group_id= local.frontend_alb_sg_id
   type              = "ingress"
  from_port         = 80
  protocol            = "tcp"
  to_port           = 80
}
resource "aws_security_group_rule" "frontend_bastion" {
  security_group_id = local.frontend_sg_id
  source_security_group_id= local.bastion_sg_id
   type              = "ingress"
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}


## frontend ALB Sg Rules####
resource "aws_security_group_rule" "frontend_alb_public" {
   type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol            = "tcp"
  to_port           = 443
}



resource "aws_security_group_rule" "bastion_laptop" {
   type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol            = "tcp"
  to_port           = 22
}

# this is the mistake we did, cart cannot acess catalogue directly it should reach it through backend_alb
# resource "aws_security_group_rule" "catalogue_cart" {
#   security_group_id = local.catalogue_sg_id
#   source_security_group_id= local.cart_sg_id
#    type              = "ingress"
#   from_port         = 8080
#   protocol            = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "user_payment" {
#   security_group_id = local.user_sg_id
#   source_security_group_id= local.payment_sg_id
#    type              = "ingress"
#   from_port         = 8080
#   protocol            = "tcp"
#   to_port           = 8080
# }
# resource "aws_security_group_rule" "cart_shipping" {
#   security_group_id = local.cart_sg_id
#   source_security_group_id= local.shipping_sg_id
#    type              = "ingress"
#   from_port         = 8080
#   protocol            = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "cart_payment" {
#   security_group_id = local.cart_sg_id
#   source_security_group_id= local.payment_sg_id
#    type              = "ingress"
#   from_port         = 8080
#   protocol            = "tcp"
#   to_port           = 8080
# }