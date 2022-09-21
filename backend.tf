terraform {
  backend "s3" {
    bucket         = "talent-academy-sudha-lab-tfstates"
    key            = "talent-academy/elk_vpc/terraform.tfstates"
    region         = "eu-west-1"
    
  }
}
