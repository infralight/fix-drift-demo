output "instance_id" {
  description = "ID of the EC2 Instance"
  value = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "Public IP address of the EC2 Instance"
  value = aws_instance.ec2_instance.public_ip
}

output "ebs_volume_ids" {
  description = "IDs of the EBS Volumes"
  value = aws_ebs_volume.ebs_volume.*.id
}
