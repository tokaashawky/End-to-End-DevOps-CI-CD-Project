Application load balancer – 
which will route the incoming requests to the listener, where we configure the routing rules
Listener – that plays an important role in making routing decisions.
Listener rules – we will configure the listener rules to route the requests to various target groups.
Target group – each target group is a collection of EC2 instances that serve a specific
                 request based on path value.
EC2 instances – each target group houses one EC2 instance.
Each instance is configured with a Nginx web server, which responds uniquely.
ources, follow the steps below:
    Configure the EC2 instances
    Create an ALB Target Group
    Add the ALB Target Group attachment
    Create an ALB Listener
    Manage custom ALB Listener rules
    Test the path-based routing on ALB
To manage AWS Application Load Balancers with Terraform ALB res