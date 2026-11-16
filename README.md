# Learning Terraform
This is the repository for the LinkedIn Learning course Learning Terraform. The full course is available from [LinkedIn Learning][lil-course-url].

![Learning Terraform][lil-thumbnail-url] 

Terraform is a DevOps tool for declarative infrastructure—infrastructure as code. It simplifies and accelerates the configuration of cloud-based environments. In this course, instructor Josh Samuelson shows how to use Terraform to configure infrastructure and manage resources with Amazon Web Services (AWS). After demonstrating how to set up AWS for Terraform, Josh covers how Terraform manages your infrastructure, as well as how to use core Terraform commands. He also delves into more advanced topics, including how to leverage code modules from the Terraform registry and how to create your own modules. Upon wrapping up this course, you'll have the knowledge you need to efficiently define and manage infrastructure with this powerful tool.

_See the readme file in the main branch for updated instructions and information._

## Current AWS example (main branch, 2026 update)

The original course used a Bitnami Tomcat AMI, which is no longer available through AWS Marketplace as of June 10, 2026. The maintained `main` branch now uses the official Amazon Linux 2023 x86_64 AMI published through AWS Systems Manager Parameter Store. **This launches a plain Amazon Linux EC2 instance; it does not install Tomcat.** The historical chapter branches remain unchanged so you can follow the original lessons.

### HCP Terraform web UI

1. Connect this GitHub repository and use the `main` branch in your HCP Terraform workspace.
2. Under **Variables → Environment variables**, configure AWS authentication (for example, `AWS_ACCESS_KEY_ID` and a **sensitive** `AWS_SECRET_ACCESS_KEY`). Prefer HCP Terraform AWS dynamic credentials/OIDC for longer-lived projects. Never commit AWS secrets.
3. Optionally, under **Variables → Terraform variables**, set `aws_region` (default: `us-west-2`) and `instance_type` (default: `t3.nano`). The provider uses `var.aws_region`, so setting only the `AWS_REGION` environment variable does not override the Terraform variable.
4. Start a **Plan**. Review the proposed changes before applying.

The AWS identity needs at least `ssm:GetParameter` for AMI discovery, and relevant EC2 permissions for the plan and any subsequent apply. HCP Terraform executes remote runs with its workspace credentials, not necessarily the credentials on your local computer. A valid AWS default VPC/network configuration is also needed to launch the sample instance.

**Costs and replacement warning:** Applying creates an AWS EC2 instance and may incur costs. The official `kernel-default` parameter tracks newer AMIs over time; a later `terraform plan` can propose **replacing** an existing instance when the resolved AMI changes. Inspect every plan before applying, especially if you have data stored on an instance.

### Local checks

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

A pull request runs these formatting and validation checks without AWS credentials. Passing validation does **not** verify AWS permissions, AMI availability, or the HCP Terraform remote plan.

References: [Bitnami AWS retirement notice](https://community.broadcom.com/tanzu/blogs/beltran-rueda-borrego/2026/05/20/important-update-transitioning-bitnami-offerings-o?CommunityKey=56a49fa1-c592-460c-aa05-019446f8102f), [AWS public AMI parameters](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami-parameter-store.html), [AWS Terraform AMI example](https://aws.amazon.com/blogs/compute/simplify-ami-discovery-with-amazon-ec2-and-ssm-parameter-store/).

## Instructions
This repository has branches for each of the videos in the course. You can use the branch pop up menu in github to switch to a specific branch and take a look at the course at that stage, or you can add `/tree/BRANCH_NAME` to the URL to go to the branch you want to access.

## Branches
The branches are structured to correspond to the videos in the course. The naming convention is `CHAPTER#_MOVIE#`. As an example, the branch named `02_03` corresponds to the second chapter and the third video in that chapter. The code is built sequentally so each branch contains the completed code for that particular video and the starting code can be found in the previous video's branch.

The `start` branch contains the starting code for the course and the `end` branch contains the completed code. The `main` branch contains a maintained AWS EC2 example.

### Instructor

Josh Samuelson 
                            
DevOps Engineer

                            

Check out my other courses on [LinkedIn Learning](https://www.linkedin.com/learning/instructors/josh-samuelson).

[lil-course-url]: https://www.linkedin.com/learning/learning-terraform-15575129?dApp=59033956
[lil-thumbnail-url]: https://cdn.lynda.com/course/3087701/3087701-1666200696363-16x9.jpg
