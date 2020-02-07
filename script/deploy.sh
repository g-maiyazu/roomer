MYSECURITYGROUP="sg-02788aaefad3140ce"
MYIP=`curl -s ifconfig.me`

aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
bundle exec cap production deploy
aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32