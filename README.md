# This repo will deploy Jenkins on AWS with Terraform

## How to use it:

- clone the repo

```
$ git clone https://github.com/chavo1/jenkins.git
$ cd jenkins
```
- Add your aws Access and Secret keys in .tfvar file
- Than...
```
$ terraform init
$ terraform apply
```
- Do not forget to destroy the environment:
```
$ terraform destroy
```

