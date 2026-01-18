output "my_instance_id" {
  description = "InstanceID of our WebSite"
  value       = aws_instance.my_webserver.id
}

output "my_instance_arn" {
  description = "InstanceARN of our WebSite"
  value       = aws_instance.my_webserver.arn
}

output "my_sg_id" {
  description = "SecurityGroup of our WebSite"
  value       = aws_security_group.my_webserver.id
}

output "webserver_public_ip" {
  value = aws_eip.web_eip.public_ip
}

output "webserver_url" {
  value = "http://${aws_eip.web_eip.public_ip}"
}
