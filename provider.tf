provider "aws" {
	access_key = ""
	secret_key = ""
	region = ""
}

provider "aws" {
	alias = "ireland"
	region = "eu-west-1"
}