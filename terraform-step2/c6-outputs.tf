# Terraform Output Values
# updating to use as for list, maps, map advanced. 

# output - for loop with list
output "for_loop_list" {
  description = "for loop with list"
  # below line works like:-   value = for x in list : print x.instace_publicdns
  value = [for instance in aws_instance.myec2vm : instance.public_dns]
  
}

# output - for loop with map
output "for_loop_map" {
  description = "for loop with map"
  # below line works like:-   value = for x in list : print  any_of_the_instance_arguments_can_be _used_as_key => x.instace_publicdns
  value = {for instance in aws_instance.myec2vm_map : instance.id => instance.public_dns}
  
}

# output - for loop with map - advanced
output "for_loop_map_advanced" {
  description = "for loop with map"
  # below line works like:-   value = for x in list : print  count_index_as_key => x.instace_publicdns
  # note the count index here has nothing to with count argumrent of instance. it is in genral index of the loop. 
  value = {for c, instance in aws_instance.myec2vm_map : c => instance.public_dns}
  
}


# output - legacy splat operator
output "splat_operator_output_legacy" {
  description = "lecagy splat operator"
  value = aws_instance.myec2vm.*.public_dns
}

# output - latest splat operator, this uses the count argumrnt of the instance
output "splat_operator_output_latest" {
  description = "latest splat operator"
  value = aws_instance.myec2vm_map[*].public_dns
  
}

# # EC2 Instance Public IP
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   value = aws_instance.myec2vm.public_ip
# }

# # EC2 Instance Public DNS
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value = aws_instance.myec2vm.public_dns
# }