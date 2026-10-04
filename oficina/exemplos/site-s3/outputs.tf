output "bucket_name" {
  value = aws_s3_bucket.site.id
}

output "website_url" {
  value = var.enable_public_website ? "http://${aws_s3_bucket_website_configuration.site.website_endpoint}" : "Website público desativado; verificar objeto no console S3."
}
