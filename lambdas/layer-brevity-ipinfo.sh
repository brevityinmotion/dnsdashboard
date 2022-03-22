#!/bin/bash

NEWLAYER="brevity-ipinfo"

## Creating a Lambda Layer
## Script credits from https://towardsdatascience.com/python-packages-in-aws-lambda-made-easy-8fbc78520e30

cd /home/ec2-user/environment/ipinfo/build/

mkdir $NEWLAYER
cd $NEWLAYER
virtualenv v-env
source ./v-env/bin/activate
## Install packages here
pip install pandas
pip install requests
pip install ipinfo
deactivate

## Next steps
mkdir python
cd python
cp -r ../v-env/lib64/python3.7/site-packages/* .
cd ..
zip -r $NEWLAYER.zip python
aws lambda publish-layer-version --layer-name $NEWLAYER --zip-file fileb://$NEWLAYER.zip --compatible-runtimes python3.7 python3.8