echo "===============================================" &&
echo "Creating SNS Topic" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4575 sns create-topic --name test-topic &&
echo "===============================================" &&
echo "Creating S3 Bucket" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket test-bucket --acl public-read-write &&
echo "===============================================" &&
echo "Putting Object in S3 Bucket" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4572 s3api put-object --bucket test-bucket --key hello --body setup.md &&
echo "===============================================" &&
echo "Listing Objects in S3 Bucket" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4572 s3api list-objects --bucket test-bucket &&
echo "===============================================" &&
echo "Subscribing API Endpoint to SNS Topic" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4575 sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --protocol http --notification-endpoint http://web:4000/api/sns_webhook &&
echo "===============================================" &&
echo "Creating Lambda Function" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4574 lambda create-function --function-name=sns-lambda --runtime=nodejs6.10 --role=r1 --handler=index.handler --zip-file fileb://lambda/Archive.zip &&
echo "===============================================" &&
echo "Subscribing Lambda Function to SNS Topic" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4575 sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --protocol lambda --notification-endpoint arn:aws:lambda:us-east-1:000000000000:function:sns-lambda &&
echo "===============================================" &&
echo "Publishing Message to SNS Topic" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4575 sns publish  --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --message 'Test Message!'

# aws --endpoint-url=http://localhost:4574 lambda invoke --function-name sns-lambda --payload '{"key1":"value1", "key2":"value2", "key3":"value3"}'
