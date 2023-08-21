# Terraform Output Values
# updating to use as for list, maps, map advanced. 
# updating with use of for_each
# output - for loop with list
output "for_loop_list" {
  description = "for loop with list"
  # below line works like:-   value = for x in list : print x.instace_publicdns
  value = [for instance in aws_instance.myec2vm : instance.public_dns]
  
}

# output - for loop with  for_each
output "for_loop_map_with_for_each" {
  description = "for loop with map"
  # below line works like:-   value = for x in list : print  any_of_the_instance_arguments_can_be _used_as_key => x.instace_publicdns
  value = { for az, instance in aws_instance.myec2vm : az => instance.public_dns }
  
}

# # output - for loop with map
# output "for_loop_map" {
#   description = "for loop with map"
#   # below line works like:-   value = for x in list : print  any_of_the_instance_arguments_can_be _used_as_key => x.instace_publicdns
#   value = {for instance in aws_instance.myec2vm_map : instance.id => instance.public_dns}
  
# }

# # output - for loop with map - advanced
# output "for_loop_map_advanced" {
#   description = "for loop with map"
#   # below line works like:-   value = for x in list : print  count_index_as_key => x.instace_publicdns
#   # note the count index here has nothing to with count argumrent of instance. it is in genral index of the loop. 
#   value = {for c, instance in aws_instance.myec2vm_map : c => instance.public_dns}
  
# }


# output - legacy splat operator 
# Note that this works only with count and not with for_each as its not a list but a map or set of strings
# output "splat_operator_output_legacy" {
#   description = "lecagy splat operator"
#   value = aws_instance.myec2vm.*.public_dns
# }

# # output - latest splat operator, this uses the count argumrnt of the instance
# output "splat_operator_output_latest" {
#   description = "latest splat operator"
#   value = aws_instance.myec2vm_map[*].public_dns
  
# }


# This will return the list of availability zones supported for a instance type
# the for loop will return a map of all the instance_type+offerings, thus the if condition is added to filter only deseired output
# get only keys from map/dict: with Keys Function - Which gets keys from a Map
output "dynamically_filtered_azs" {
  # 
  value = keys({ 
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: az => details.instance_types 
    if length(details.instance_types) != 0 
    })
}

output "dynamically_fetched_all_azs" {
  # 
  value = { 
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: az => details.instance_types 
    if length(details.instance_types) != 0 
    }
}