terraform {
    backend "s3"{
         bucket = "firstiti"
         key = "dev/terraform.tfstate"
         region = "us-west-2"
         profile="mylab"
       
  }
}
