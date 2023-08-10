# aws-instance-first-script

![](https://github.com/Dineshjava2/aws-instance-first-script/tree/master)

A Terraform module for creating AWS EC2 instance.

## Usage

```hcl
module "ec2_instance" {
  source     = "git::https://github.com/Dineshjava2/aws-instance-first-script"

  region    = "ap-south-1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | AWS region | string | ap-south-1 | yes |
