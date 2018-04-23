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
echo "Publishing Message to SNS Topic" &&
echo "===============================================" &&
aws --endpoint-url=http://localhost:4575 sns publish  --topic-arn arn:aws:sns:us-east-1:123456789012:test-topic --message 'Test Message!'
