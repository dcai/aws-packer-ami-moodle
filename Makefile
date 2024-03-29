AWSACCESSKEY=AKIAJ2DZKVA4BAAQHIMA
AWSSECRETKEY=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
AWSREGION=us-east-1

validate-moodle-ami:
	packer validate -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    packer-moodle.json
build-test-ami:
	packer build -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "httpd_user=www-data" \
	    -var "httpd_group=www-data" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    -var "aws_security_group_id=sg-18c5b767" \
	    -var "efs_endpoint=fs-cbda6682.efs.us-east-1.amazonaws.com" \
	    -var "ami_name=test" \
	    packer-moodle.json

build-moodle-ami-tsms:
	packer build -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "httpd_user=www-data" \
	    -var "httpd_group=www-data" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    -var "aws_security_group_id=sg-18c5b767" \
	    -var "efs_endpoint=fs-cbda6682.efs.us-east-1.amazonaws.com" \
	    -var "moodle_download_url=https://s3.amazonaws.com/radixlms-htdocs/htdocs.tar.xz" \
	    -var "moodle_dbhost=moodleaurorainstance1-cluster.cluster-csanwariuqeb.us-east-1.rds.amazonaws.com" \
	    -var "moodle_dbname=2016_tsms" \
	    -var "moodle_dbuser=moodle" \
	    -var "moodle_dbpass=mYJMp6aAZZ6xERg" \
	    -var "moodle_dataroot=tsms" \
	    -var "moodle_wwwroot=charterresources-moodle.tux.im" \
	    -var "ami_name=moodle-tsms" \
	    packer-moodle.json

build-moodle-ami-rcsa:
	packer build -var "aws_access_key=${AWSACCESSKEY}" \
	    -var "httpd_user=www-data" \
	    -var "httpd_group=www-data" \
	    -var "aws_secret_key=${AWSSECRETKEY}" \
	    -var "aws_region=${AWSREGION}" \
	    -var "aws_security_group_id=sg-18c5b767" \
	    -var "efs_endpoint=fs-cbda6682.efs.us-east-1.amazonaws.com" \
	    -var "moodle_download_url=https://s3.amazonaws.com/radixlms-htdocs/htdocs.tar.xz" \
	    -var "moodle_dbhost=mdl-rcsa.csanwariuqeb.us-east-1.rds.amazonaws.com" \
	    -var "moodle_dbname=moodle_rcsa" \
	    -var "moodle_dbuser=moodle" \
	    -var "moodle_dbpass=mYJMp6aAZZ6xERg" \
	    -var "moodle_dataroot=moodle_rcsa" \
	    -var "moodle_wwwroot=moodle-rcsa.tux.im" \
	    -var "ami_name=moodle-rcsa" \
	    packer-moodle.json
