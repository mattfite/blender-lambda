#!/bin/sh


# Useful for testing the consumer

PAYLOAD='{
    "Records": [
        {
            "body": "{\"file_name\": \"cube-3.1.0.blend\", \"frame\": 17, \"support_files\": [\"image-1.jpg\"]}"
        }
    ]
}'

P64=$(echo -n $PAYLOAD | base64)

aws lambda invoke \
    --function-name blender-lambda-consumer \
    --payload "$P64" \
    --region us-west-1 \
    --invocation-type Event \
    response.json

