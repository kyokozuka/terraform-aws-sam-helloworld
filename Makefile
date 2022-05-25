AWS_POFILE=PROFILE
SAM_BUCKET=ABCDE
SAM_APP_DIR=hello_world
INFRA_DIR=infra
TEMPLATE_FILE=template.yaml

create_bucket:
	export AWS_PROFILE=$(AWS_POFILE)
	aws s3 mb s3://${SAM_BUCKET}

apply:
	cd $(SAM_APP_DIR) && sam build
	cd $(SAM_APP_DIR) && sam package --profile $(AWS_POFILE) --s3-bucket $(SAM_BUCKET) --output-template-file ../$(TEMPLATE_FILE)
	export AWS_PROFILE=$(AWS_POFILE)
	cd $(INFRA_DIR) && terraform apply

destroy:
	export AWS_PROFILE=$(AWS_POFILE)
	cd $(INFRA_DIR) && terraform destroy