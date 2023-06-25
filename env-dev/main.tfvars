env = "dev"

components= {
    frontend = {
        tags = {monitor = "true", env = "dev"}
    }
    mongodb = {
        tags = { env = "dev"}
    }
    catalogue = {
        tags = {monitor = "true", env = "dev"}
    }
    redis = {
        tags = { env = "dev"}
    }
    user = {
        tags = {monitor = "true", env = "dev"}
    }
    cart = {
        tags = {monitor = "true", env = "dev"}
    }
    mysql = {
        tags = { env = "dev"}
    }
    shipping = {
        tags = {monitor = "true", env = "dev"}
    }
    rabbitmq = {
        tags = { env = "dev"}
    }
    payment = {
        tags = {monitor = "true", env = "dev"}
    } 

}

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

# we can write the above code like above also
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
