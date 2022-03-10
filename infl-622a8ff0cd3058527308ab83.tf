resource "aws_iam_policy" "ANPARMDQF5IDMCVLUWWWR" {
	id = "ANPARMDQF5IDMCVLUWWWR"
	name = "stag-tiers-policy"
	policy = <<POLICY
{
	"Statement": [
		{
			"Action": [
				"kms:Decrypt",
				"kms:DescribeKey",
				"kms:DescribeCustomKeyStores",
				"kms:DescribeKey",
				"kms:GetKeyPolicy",
				"kms:GetKeyRotationStatus",
				"kms:GetParametersForImport",
				"kms:GetPublicKey",
				"kms:ListAliases",
				"kms:ListGrants",
				"kms:ListKeyPolicies",
				"kms:ListKeys",
				"kms:ListResourceTags",
				"kms:ListRetirableGrants",
				"kms:GenerateDataKey"
			],
			"Effect": "Allow",
			"Resource": "arn:aws:kms:us-west-2:094724549126:key/77769c4d-721f-46c4-8f61-91386a716477"
		},
		{
			"Action": [
				"sts:AssumeRole",
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Effect": "Allow",
			"Resource": "*"
		},
		{
			"Action": [
				"ec2:DescribeNetworkInterfaces",
				"ec2:CreateNetworkInterface",
				"ec2:DeleteNetworkInterface",
				"ec2:AttachNetworkInterface"
			],
			"Effect": "Allow",
			"Resource": "*"
		},
		{
			"Action": [
				"s3:Get*",
				"s3:List*",
				"s3:Put*",
				"s3:Delete*"
			],
			"Effect": "Allow",
			"Resource": "arn:aws:s3:::stag-free-tier-open-assets/*"
		}
	],
	"Version": "2012-10-17"
}
POLICY
}