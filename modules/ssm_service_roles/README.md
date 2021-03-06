# aws-terraform-iam_resources/modules/ssm_service_roles

This submodule creates an IAM Role for the SSM Services

## Basic Usage

```
module "ssm_service_roles" {
 source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-iam_resources//modules/ssm_service_roles?ref=v0.0.1"

 # Optional parameters
 #
 # create_automation_role         = true
 # create_maintenance_window_role = true
}
```

Full working references are available at [examples](examples)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_automation\_role | A variable to control whether the Automation Service IAM role should be created | string | `"true"` | no |
| create\_maintenance\_window\_role | A variable to control whether the Maintenance Window Service IAM role should be created | string | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| automation\_arn | Automation Service IAM role ARN |
| automation\_id | Automation Service IAM role id |
| automation\_instance\_profile | Automation Service IAM Instance Profile name |
| automation\_name | Automation Service IAM role name |
| maintenance\_window\_arn | Maintenance Window IAM role ARN |
| maintenance\_window\_id | Maintenance Window IAM role id |
| maintenance\_window\_instance\_profile | Maintenance Window IAM Instance Profile name |
| maintenance\_window\_name | Maintenance Window IAM role name |
| module\_details | All details about created SSM Service Roles |

