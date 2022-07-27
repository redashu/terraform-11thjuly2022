data "archive_file" "ashu_lambda_package" {
  type = "zip"
  source_file = "${path.module}/ashupycode/lambda_function.py"
  output_path = "pycodev1.zip"
}

resource "aws_lambda_function" "ashufunction" {
    function_name = "ashufunc001"
    filename = "pycodev1.zip"
    runtime = "python3.9"
    timeout = 15
    handler = "lambda_function.lambda_handler"
    role = aws_iam_role.ashu_lambda_role.arn
    source_code_hash = data.archive_file.ashu_lambda_package.output_base64sha256
  
}