output "ip_publico_k8s1" {
    description = "IPs publico kubernetes1"
  value = aws_eip.k8s1.public_ip
}
output "ip_privado_k8s1" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

output "ip_publico_k8s2" {
    description = "IPs publico kubernetes2"
  value = aws_eip.k8s2.public_ip
}
output "ip_pprivado_k8s2" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

output "ip_publico_k8s3" {
    description = "IPs publico kubernetes3"
  value = aws_eip.k8s3.public_ip
}
output "ip_privado_k8s3" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

output "ip_publico_ansible" {
    description = "IPs publico ansible"
  value = aws_eip.ansible.public_ip
}