data "aws_iam_policy_document" "ashu_lambda_role_policy" {
    statement {
      effect = "Allow"
      actions = ["sts:AssumeRole"]
      principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    }
  
}

resource "aws_iam_role" "ashu_lambda_role" {
    name = "ashu_lambda_python_role1" # please change this 
    assume_role_policy = data.aws_iam_policy_document.ashu_lambda_role_policy.json
  
}