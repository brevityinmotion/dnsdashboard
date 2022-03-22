#!/bin/bash
LAMBDANAME="brevity-process-route53"
mkdir /home/ec2-user/environment/ipinfo/build/$LAMBDANAME
cp /home/ec2-user/environment/ipinfo/lambdas/lambda_function_$LAMBDANAME.py /home/ec2-user/environment/ipinfo/build/$LAMBDANAME/lambda_function.py
cd /home/ec2-user/environment/ipinfo/build/$LAMBDANAME
zip -r ../$LAMBDANAME.zip *
aws s3 cp /home/ec2-user/environment/ipinfo/build/$LAMBDANAME.zip s3://brevity-deploy/infra/
aws lambda update-function-code --function-name $LAMBDANAME --s3-bucket brevity-deploy --s3-key infra/$LAMBDANAME.zip