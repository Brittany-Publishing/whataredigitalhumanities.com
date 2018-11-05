deploy:
	rm Makefile .travis.yml .*
	aws s3 sync ./ s3://whataredigitalhumanities.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2LWZG2785UBPQ --paths '/*'
