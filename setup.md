* Create an SNS topic:
```
aws --endpoint-url=http://localhost:4575 sns create-topic --name test-topic --region=us-east-1
```
* Set up an HTTP subscription to the topic:
```
aws --endpoint-url=http://localhost:4575 sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --protocol http --notification-endpoint http://web:4000/api/sns_webhook --region=us-east-1
```
* Create a lambda to subscribe to the topic:
```
aws --endpoint-url=http://localhost:4574 lambda create-function --function-name=sns-lambda --runtime=python2.7 --role=r1 --handler=lambda.handler --zip-file fileb://lambda.zip --region=us-east-1
```

* Subscribe the lambda to the topic:
```
aws sns subscribe --endpoint-url=http://localhost:4575 --region=us-east-1 --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --protocol lambda --notification-endpoint arn:aws:lambda:us-east-1:000000000000:function:sns-lambda
```


* Publish a message to the topic:
```
aws --endpoint-url=http://localhost:4575 sns publish  --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --region=us-east-1 --message 'Test Message!'
```
