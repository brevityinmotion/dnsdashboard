#!/bin/bash
LAMBDANAME="brevity-process-route53"
mkdir /home/ec2-user/environment/ipinfo/build/$LAMBDANAME
cp /home/ec2-user/environment/ipinfo/lambdas/lambda_function_$LAMBDANAME.py /home/ec2-user/environment/ipinfo/build/$LAMBDANAME/lambda_function.py
cd /home/ec2-user/environment/ipinfo/build/$LAMBDANAME
zip -r ../$LAMBDANAME.zip *
aws s3 cp /home/ec2-user/environment/ipinfo/build/$LAMBDANAME.zip s3://brevity-deploy/infra/
aws lambda create-function --function-name $LAMBDANAME --runtime python3.7 --handler lambda_function.lambda_handler --role arn:aws:iam::000017942944:role/brevity-lambda --layers arn:aws:lambda:us-east-1:000017942944:layer:brevity-ipinfo:1 --code S3Bucket=brevity-deploy,S3Key=infra/$LAMBDANAME.zip --description 'Generates an IPinfo and Route53 logging dashboard.' --timeout 300 --package-type Zip