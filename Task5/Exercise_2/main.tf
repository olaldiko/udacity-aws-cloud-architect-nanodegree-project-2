provider "aws" {
  region = "${var.aws_region}"
}

data "aws_iam_policy_document" "lambda_function_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "logging_policy_document" {
    statement {
        effect = "Allow"
        actions = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
        resources = ["arn:aws:logs:*:*:*"]
    }
}

resource "aws_iam_policy" "lambda_function_logging" {
    name = "lambda_logging_policy"
    path = "/"
    policy = "${data.aws_iam_policy_document.logging_policy_document.json}"
}

resource "aws_iam_policy_attachment" "lambda_logs_attachment" {
    name        = "Logging policy for lambda"
    roles      = [aws_iam_role.iam_for_lambda.name]
    policy_arn = "${aws_iam_policy.lambda_function_logging.arn}"
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_function_policy_document.json


}
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${var.source_file}"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "udacity_project_exercise" {
  filename         = "lambda_function_payload.zip"
  function_name    = "${var.function_name}"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.10"
  timeout          = "5"
  memory_size      = "128"

  environment {
    variables = {
      greeting = "Hello from udacity project exercise"
    }
  }
}
