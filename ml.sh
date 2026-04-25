user_data = <<-EOF
#!/bin/bash
yum update -y
yum install docker -y
service docker start

docker build -t ml-app /home/ec2-user || true
docker run -d -p 80:80 ml-app
EOF