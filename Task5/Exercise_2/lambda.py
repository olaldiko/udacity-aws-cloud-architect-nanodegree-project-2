import os

def lambda_handler(event, context):
    print("{} from Lambda logs!".format(os.environ['greeting']))
    return "{} from Lambda!".format(os.environ['greeting'])
