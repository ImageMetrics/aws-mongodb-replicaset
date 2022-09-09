GIT_HASH=$(git rev-parse --short HEAD)
DEPLOYMENT_BUCKET=aws-mongodb-replicaset

aws cloudformation package \
  --template ./templates/mongodb.template \
  --s3-bucket ${DEPLOYMENT_BUCKET}t \
  --region us-east-1 \
  --output-template-file ./packaged-template.template \
  --metadata changeset=${GIT_HASH}

aws s3 cp --recursive ./templates s3://${DEPLOYMENT_BUCKET}/deployment_${GIT_HASH}/templates 
aws s3 cp --recursive ./submodules s3://${DEPLOYMENT_BUCKET}/deployment_${GIT_HASH}/submodules
aws s3 cp --recursive ./scripts s3://${DEPLOYMENT_BUCKET}/deployment_${GIT_HASH}/scripts