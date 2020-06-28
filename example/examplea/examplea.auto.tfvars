common_tags = {
  madeby      = "James Woolfenden"
  Description = "Created for ECS cluster default"
  Name        = "ECS default - ECS SecurityGroup"
}

target_group_arn = "ecsTaskExecutionRole"

lb = {
  container_name = "examplea"
  container_port = "80"
}

task_definition = {
  family                   = "first-run-task-definition"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  container_definitions    = "[{\"command\":[\"/bin/sh -c \\\"echo '<html> <head> <title>Amazon ECS Sample App</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Amazon ECS Sample App</h1> <h2>Congratulations!</h2> <p>Your application is now running on a container in Amazon ECS.</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html && httpd-foreground\\\"\"],\"cpu\":256,\"entryPoint\":[\"sh\",\"-c\"],\"environment\":[],\"essential\":true,\"image\":\"httpd:2.4\",\"links\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-group\":\"/ecs/first-run-task-definition\",\"awslogs-region\":\"eu-west-1\",\"awslogs-stream-prefix\":\"ecs\"}},\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"sample-app\",\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\"}],\"volumesFrom\":[]}]"
}

desired_count = 1
