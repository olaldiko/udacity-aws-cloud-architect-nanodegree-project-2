output "ec2_instance_ids" {
  description = "IDs of ec2 instances"
  value       = ["${aws_instance.udacity_app_instance.*.id}"]
}
