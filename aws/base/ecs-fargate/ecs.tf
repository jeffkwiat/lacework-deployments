resource "aws_ecs_cluster" "terraform-cluster" {
  name = "terraform-cluster"
}

resource "aws_ecs_task_definition" "terraform-task-definition" {
  family = "terraform-task-definition"
  network_mode = "awsvpc"

  # These are the minimum values for Fargate containers.
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]

  # This is the role under which ECS will execute our task. This role becomes more important
  # as we add integrations with other AWS services later on.
  execution_role_arn = aws_iam_role.terraform-task-execution-role.arn

  container_definitions = jsonencode([
    {
      "dnsSearchDomains" : null,
      "environmentFiles" : null,
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "secretOptions" : null,
        "options" : {
          "awslogs-group" : aws_cloudwatch_log_group.terraform-log-group.name,
          "awslogs-region" : "us-west-1",
          "awslogs-stream-prefix" : "ecs"
        }
      },
      "entryPoint" : [
        "sh",
        "-c"
      ],
      "portMappings" : [
        {
          "hostPort" : 80,
          "protocol" : "tcp",
          "containerPort" : 80
        }
      ],
      "command" : [
        "/bin/sh -c \"echo '<html> <head> <title>Amazon ECS Sample App</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Amazon ECS Sample App</h1> <h2>Congratulations!</h2> <p>Your application is now running on a container in Amazon ECS.</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html && httpd-foreground\""
      ],
      "linuxParameters" : null,
      "cpu" : 256,
      "environment" : [],
      "resourceRequirements" : null,
      "ulimits" : null,
      "dnsServers" : null,
      "mountPoints" : [],
      "workingDirectory" : null,
      "secrets" : null,
      "dockerSecurityOptions" : null,
      "memory" : null,
      "memoryReservation" : 512,
      "volumesFrom" : [],
      "stopTimeout" : null,
      "image" : "httpd:2.4",
      "startTimeout" : null,
      "firelensConfiguration" : null,
      "dependsOn" : null,
      "disableNetworking" : null,
      "interactive" : null,
      "healthCheck" : null,
      "essential" : true,
      "links" : [],
      "hostname" : null,
      "extraHosts" : null,
      "pseudoTerminal" : null,
      "user" : null,
      "readonlyRootFilesystem" : null,
      "dockerLabels" : null,
      "systemControls" : null,
      "privileged" : null,
      "name" : "terraform-app"
    }
  ])
}

resource "aws_ecs_service" "terraform-service" {
  name            = "terraform-service"
  cluster         = aws_ecs_cluster.terraform-cluster.id
  task_definition = aws_ecs_task_definition.terraform-task-definition.arn
  desired_count   = 1
  launch_type = "FARGATE"

  network_configuration {
    assign_public_ip = true

    security_groups = [
      aws_security_group.sg-egress.id,
      aws_security_group.sg-ingress.id,
    ]

    subnets = [
      aws_subnet.private.id,
      aws_subnet.public.id
    ]
  }
}

# This is the role under which ECS will execute our task. This role becomes more important
# as we add integrations with other AWS services later on.

# The assume_role_policy field works with the following aws_iam_policy_document to allow
# ECS tasks to assume this role we're creating.
resource "aws_iam_role" "terraform-task-execution-role" {
  name               = "terraform-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs-task-assume-role.json
}

data "aws_iam_policy_document" "ecs-task-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# Normally we'd prefer not to hardcode an ARN in our Terraform, but since this is an AWS-managed
# policy, it's okay.
data "aws_iam_policy" "ecs-task-execution-role" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Attach the above policy to the execution role.
resource "aws_iam_role_policy_attachment" "ecs-task-execution-role" {
  role       = aws_iam_role.terraform-task-execution-role.name
  policy_arn = data.aws_iam_policy.ecs-task-execution-role.arn
}

resource "aws_cloudwatch_log_group" "terraform-log-group" {
  name = "/ecs/terraform-task-definition"
  retention_in_days = 0
}