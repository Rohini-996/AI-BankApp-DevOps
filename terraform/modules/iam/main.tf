resource "aws_iam_role" "bankapp_pod_role" {
  name = var.role_name

  assume_role_policy = jsonencode ({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
	Principal = {
	  Service = "pods.eks.amazonaws.com"
	}
	Action = [
	  "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })
 
  tags = {
    Name        = var.role_name
    Environment = var.environment
    Project     = "AI-BankApp"
  }
}

