resource "aws_cloudformation_stack" "helloworld" {
  name          = "helloworld"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_AUTO_EXPAND"]
  template_body = file("../template.yaml")
}

data "aws_cloudformation_stack" "helloworld" {
  name          = "helloworld"
  depends_on    = [
    aws_cloudformation_stack.helloworld
  ]
}