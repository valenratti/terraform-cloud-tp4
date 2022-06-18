locals {
  bucket_name = "b123123123123-itba-cloud-computing"
  path        = "../resources"

  s3 = {

    # 1 - Website
    website = {
      bucket_name = local.bucket_name
      path        = "../resources"

      objects = {
        error = {
          filename     = "html/error.html"
          content_type = "text/html"
        }
        image1 = {
          filename     = "images/image1.png"
          content_type = "image/png"
        }
        image2 = {
          filename     = "images/image2.jpg"
          content_type = "image/jpeg"
        }
      }
    }

    # 2 - WWW Website
    www-website = {
      bucket_name = "www.${local.bucket_name}"
    }

    #3 - Logs
    logs = {
      bucket_name = "${local.bucket_name}/logs"
    }
  }
}

locals {
  vpc_name                  = "grupo-8-vpc"
  vpc_cidr_block            = "10.0.0.0/16"
  vpc_private_subnet_name   = "grupo-8-private-subnet-vpc"
  private_subnet_cidr_block = "10.0.1.0/24"
}

locals {
  vpc_endpoint_services = {
    dynamodb = {
      service = "com.amazonaws.us-east-1.dynamodb"
    }
    s3 = {
      service = "com.amazonaws.us-east-1.s3"
    }
  }
}