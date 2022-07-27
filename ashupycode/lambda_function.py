import json
def lambda_handler(event, context):
    # TODO implement
    message = 'Hello {} ! welcome to Lambda '.format(event['key1'])
    return {
        'statusCode': 200,
        'my message is ' : message 
    }
