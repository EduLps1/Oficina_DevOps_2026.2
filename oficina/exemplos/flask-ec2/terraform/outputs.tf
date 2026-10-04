output "public_ip" {
  value = aws_instance.app.public_ip
}

output "health_url" {
  value = "http://${aws_instance.app.public_ip}:5000/health"
}
