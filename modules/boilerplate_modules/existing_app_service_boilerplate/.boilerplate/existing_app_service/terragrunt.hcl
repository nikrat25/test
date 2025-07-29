terraform {
  source = "../../../config/resources/app_service"
}


inputs = {
 
  app_type = "{{.app_type}}"

}
