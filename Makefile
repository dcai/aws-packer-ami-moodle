AWSACCESSKEY=AKIAJ2DZKVA4BAAQHIMA
AWSSECRETKEY=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
AWSREGION=us-east-1

validate-moodle-ami:
	packer validate -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    packer-moodle.json

build-moodle-ami:
	packer build -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    packer-moodle.json
