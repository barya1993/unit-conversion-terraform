variable "region" {
  description = "Location for load balancer and Cloud Run resources"
  default     = "us-central1"
}


variable "lb_name" {
  description = "Name for load balancer and associated resources"
  default     = "unit-conversion-frontend-lb"
}
