module "fargate" {
  source                = "../../"
  common_tags           = "${var.common_tags}"
  container_definitions = "[{\"command\":[\"/bin/sh -c \\\"echo '<html> <head> <title>Amazon ECS Sample App</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Amazon ECS Sample App</h1> <h2>Congratulations!</h2> <p>Your application is now running on a container in Amazon ECS.</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html && httpd-foreground\\\"\"],\"cpu\":256,\"entryPoint\":[\"sh\",\"-c\"],\"environment\":[],\"essential\":true,\"image\":\"httpd:2.4\",\"links\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-group\":\"/ecs/first-run-task-definition\",\"awslogs-region\":\"eu-west-1\",\"awslogs-stream-prefix\":\"ecs\"}},\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"sample-app\",\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\"}],\"volumesFrom\":[]}]"
  name                  = "my-first-service"
  container_port        = "${var.container_port}"
  cluster               = "arn:aws:ecs:eu-west-1:${data.aws_caller_identity.current.account_id}:cluster/${var.cluster}"
  subnets               = ["${data.aws_subnet_ids.cluster.ids}"]
  target_group_arn      = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  vpc_id                = "${element(data.aws_vpcs.cluster.ids, 0)}"
  family                = "first-run-task-definition"
}
