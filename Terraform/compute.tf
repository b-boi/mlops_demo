resource "aws_instance" "app" {
  ami           = "ami-0c76bd4bd302b30ec" # Amazon Linux 2 (eu-west-2)
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_app.id

  vpc_security_group_ids = [aws_security_group.app_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  user_data = <<-EOF
  #!/bin/bash
yum update -y
yum install -y docker git
service docker start
usermod -aG docker ec2-user

cd /home/ec2-user

# Clone your repo (replace with your GitLab repo)
git clone https://github.com/b-boi/mlops_demo.git
cd mlops-demo/app

docker build -t ml-app .
docker run -d -p 80:80 ml-app
EOF


  tags = {
    Name = "app-ml-node"
  }
}