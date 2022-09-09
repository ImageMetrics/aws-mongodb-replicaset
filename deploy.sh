GIT_HASH=$(git rev-parse --short HEAD)

aws cloudformation package \
  --template ./templates/mongodb.template \
  --s3-bucket aws-mongodb-replicaset
  --output-template-file ./templates/packaged-template.template
  --metadata changeset=${GIT_HASH}