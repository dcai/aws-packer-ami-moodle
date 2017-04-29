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
	    -var "aws_security_group_id=sg-18c5b767" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    -var "efs_endpoint=fs-cbda6682.efs.us-east-1.amazonaws.com" \
	    -var "moodle_dbhost=moodleaurorainstance1-cluster.cluster-csanwariuqeb.us-east-1.rds.amazonaws.com" \
	    -var "moodle_dbname=2016_tsms" \
	    -var "moodle_dbuser=moodle" \
	    -var "moodle_dbpass=mYJMp6aAZZ6xERg" \
	    -var "moodle_dataroot=tsms" \
	    -var "moodle_wwwroot=charterresources-moodle.tux.im" \
	    packer-moodle.json
