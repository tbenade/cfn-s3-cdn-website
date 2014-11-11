CloudFormation {
  AWSTemplateFormatVersion "2010-09-09"
  Description "Provision an S3 WebSite with Cloudfront CDN"
  
  Parameter("BucketName") {
    Type :String
    Description "Name of the bucket to store site assets"
    Default "freelollies"
  }
    
  S3_Bucket(:SiteBucket) {
    DeletionPolicy "Retain"
  }
}