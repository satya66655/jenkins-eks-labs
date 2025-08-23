# Jenkins + EKS Lab

Repos:
- infra/ec2-b: code to provision EC2 "Instance B" with Docker
- docker: Dockerfile and image build materials
- app: sample app sources
- k8s: Kubernetes manifests (Deployment/Service/Secret)
- helm: Helm chart(s)
- .jenkins: Jenkinsfile(s) for CI/CD

## EC2-B Provisioning

Scripts under `infra/ec2-b/` launch **Instance B** (Amazon Linux 2023) and install Docker using user-data.

- `provision-ec2-b.sh`: Launches EC2 instance with tags and prints public IP.
- `userdata-docker.sh`: Configures Docker and adds `ec2-user` to the docker group.

