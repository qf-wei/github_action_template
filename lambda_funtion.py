import json
import boto3

def lambda_handler(event, context):
    client = boto3.client("s3")
    response = client.list_buckets()
    return {
        "statusCode": 200,
        "body": json.dumps(response)
    }