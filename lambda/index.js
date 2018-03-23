var AWS = require('aws-sdk');


exports.handler = function(event, context, callback) {
  putObjectToS3('test-bucket', 'lambda', event);
  callback(null, "Executed successfully");
};


function putObjectToS3(bucket, key, data){
    var s3 = new AWS.S3({ endpoint: 'http://localhost:4572', s3ForcePathStyle: true });
        var params = {
            Bucket : bucket,
            Key : key,
            Body : data
        }
        s3.putObject(params, function(err, data) {
          if (err) console.log(err, err.stack);
          else     console.log(data);
        });
}
