terraform {
  source = "../../../config/resources/app_service"
}


inputs = {
 
  type = "{{.type}}"

  contributer = "{{.contributer}}"

  security_group_member_de = "{{.security_group_member_de}}"

  

}
