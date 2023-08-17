# TODO: Define the variable for aws_region
variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "source_file" {
  type = string
  default = "lambda.py"
}

variable "function_name" {
  type = string
  default = "udacity_project_exercise"
}