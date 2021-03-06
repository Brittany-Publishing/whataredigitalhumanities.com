deploy:
	aws s3 rm s3://whataredigitalhumanities.com --exclude "*" --include ".*" --include "Makefile" --recursive
	aws s3 sync ./ s3://whataredigitalhumanities.com --acl public-read --delete --exclude ".*"
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2LWZG2785UBPQ --paths '/*'
