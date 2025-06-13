TF_DIR := terraform
DURATION := 3000  # 50 minutes in seconds

terraform: get_ip init plan confirm_apply wait destroy

get_ip:
	@echo "📡 Getting your public IP address..."
	$(eval MY_IP := $(shell curl -s ifconfig.me))
	@echo "Your IP is $(MY_IP)"
	echo 'allowed_ips = ["$(MY_IP)/32"]' > $(TF_DIR)/ip.auto.tfvars

init:
	@echo "🔧 Initializing Terraform..."
	cd $(TF_DIR) && terraform init -upgrade

plan:
	@echo "🧪 Running Terraform plan..."
	cd $(TF_DIR) && terraform plan -out=tfplan

confirm_apply:
	@read -p "❓ Do you want to apply the above plan? (yes/no): " answer; \
	if [ "$$answer" = "yes" ]; then \
		echo "🚀 Applying Terraform..."; \
		cd $(TF_DIR) && terraform apply -auto-approve tfplan; \
	else \
		echo "❌ Aborting apply."; \
		exit 1; \
	fi

wait:
	@echo "⏳ Sleeping for $(DURATION) seconds (50 min)..."
	sleep $(DURATION)

destroy:
	@echo "🧨 Destroying infrastructure..."
	cd $(TF_DIR) && terraform destroy -auto-approve
	@echo "✅ Cleanup complete."

# Optional targets to apply specific components (placeholders for modular TF files)
vpc:
	cd $(TF_DIR) && terraform apply -target=module.vpc

s3:
	cd $(TF_DIR) && terraform apply -target=aws_s3_bucket.app_bucket

route53:
	cd $(TF_DIR) && terraform apply -target=aws_route53_zone.main

rds:
	cd $(TF_DIR) && terraform apply -target=module.db

elb:
	@echo "🧪 ELB not yet defined. Add to Terraform to enable."

ec2:
	cd $(TF_DIR) && terraform apply -target=aws_instance.chatbot