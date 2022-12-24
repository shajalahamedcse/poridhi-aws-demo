ecr_repository_name := poridhi-web
ecr_uri := 644341644844.dkr.ecr.us-east-1.amazonaws.com
ecr_image_version_tag := v1.0.1
aws_region := us-east-1

aws_docker_login:
	aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin ${ecr_uri}

docker_build:	
	docker build -t ${ecr_repository_name}:${ecr_image_version_tag} .
	docker tag ${ecr_repository_name}:${ecr_image_version_tag} ${ecr_uri}/${ecr_repository_name}:${ecr_image_version_tag}

docker_push:
	docker push ${ecr_uri}/${ecr_repository_name}:${ecr_image_version_tag}