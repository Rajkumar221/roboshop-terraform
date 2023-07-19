env = "dev"

# components= {
#     frontend = {
#         tags = {monitor = "true", env = "dev"}
#     }
#     mongodb = {
#         tags = { env = "dev"}
#     }
#     catalogue = {
#         tags = {monitor = "true", env = "dev"}
#     }
#     redis = {
#         tags = { env = "dev"}
#     }
#     user = {
#         tags = {monitor = "true", env = "dev"}
#     }
#     cart = {
#         tags = {monitor = "true", env = "dev"}
#     }
#     mysql = {
#         tags = { env = "dev"}
#     }
#     shipping = {
#         tags = {monitor = "true", env = "dev"}
#     }
#     rabbitmq = {
#         tags = { env = "dev"}
#     }
#     payment = {
#         tags = {monitor = "true", env = "dev"}
#     } 

# }

tags = {
    company_name = "XYZ Tech"
    business = "ecommerce"
    business_unit = "retail"
    cost_center = "322"
    project_name = "roboshop"

}

# vpc= {
#     main = {
#         cidr_block = "10.0.0.0/16"
#         subnets = {
#             web = {
#                 s1 = {
#                     cidr_block = "10.0.0.0/24"
#                     az = "us-east-1a"
#                 }
#                 s2 = {
#                     cidr_block = "10.0.1.0/24"
#                     az = "us-east-1b"
#             }
#         }
        

#         }
#     }
# }

# we can write the below code like above also
vpc = {
    main ={
        cidr_block = "10.0.0.0/16"
        subnets = {
            web    = { cidr_block = ["10.0.0.0/24", "10.0.1.0/24"] }
            app    = { cidr_block = ["10.0.2.0/24", "10.0.3.0/24"] }
            db     = {  cidr_block = ["10.0.4.0/24", "10.0.5.0/24"] }
            public = { cidr_block = ["10.0.6.0/24", "10.0.7.0/24"] }
            
        }
    }
}

default_vpc_id = "vpc-0204835e11042bbf4"
default_vpc_rt = "rtb-0ee6ac2814dcf2bf6"
allow_ssh_cidr = ""
#we need to give workstation ip address in allow_ssh_cidr
zone_id = ""
# we have to provide route53 zone id in above code
kms_key_id = ""
# we have to provide kms key above
kms_key_arn = ""
allow_prometheus_cidr = ""


rabbitmq = {
    main = {
        component = "rabbitmq"
        instance_type = "t3.small"

    }
}

rds = {
    main = {
        component = "mysql"
        engine = "aurora-mysql"
        engine_version = "5.7.mysql_aurora.2.11.3"
        database_name = "dummy"
        instance_count = 1
        instance_class = "db.t3.small"

    }
}

documentdb = {
    main = {
        component = "docdb"
        engine = "docdb"
        engine_version = "4.0.0"
        db_instance_count = 1
        instance_class = "db.t3.medium"

    }
}

elasticcache = {
    main = {
        component = "elasticcache"
        engine = "redis"
        engine_version = "6.x"
        replica_for_node_group = 1
        num_node_groups = 1
        node_type = "cache.t3.micro"
        parameter_group_name = "default.redis3.2.cluster.on"
    }
}

alb = {
    public = {
        name = "public"
        internal = false
        load_balancer_type = "application"
        subnet_ref = "public"
    }
    private = {
        name = "private"
        internal = true
        load_balancer_type = "application"
        subnet_ref = "private"

    }
}

apps = {
    cart = {
        component = "cart"
        app_port = 8080
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "app"
        lb_ref = "private"
        lb_rule_priority = 100
    }
    catalogue = {
        component = "catalogue"
        app_port = 8080
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "app"
        lb_ref = "private"
        lb_rule_priority = 101
        extra_param_access = "docdb_arn"
    user = {
        component = "user"
        app_port = 8080
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "app"
        lb_ref = "private"
        lb_rule_priority = 102
        extra_param_access = "docdb_arn"
    }
    shipping = {
        component = "shipping"
        app_port = 8080
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "app"
        lb_ref = "private"
        lb_rule_priority = 103
    }
    payment = {
        component = "payment"
        app_port = 8080
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "app"
        lb_ref = "private"
        lb_rule_priority = 104
    }
    frontend = {
        component = "frontend"
        app_port = 80
        instance_type = "t3.small"
        desired_capacity = 1
        max_size = 1
        min_size = 1
        subnet_ref = "web"
        lb_ref = "public"
        lb_rule_priority = 100
    }
}
}