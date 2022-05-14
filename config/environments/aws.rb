require 'aws-sdk-s3'

Aws.config.update({
                    region: "us-east-1",
                    credentials: Aws::Credentials.new("AKIA37R36ZD5YOP2477C", "EzVmSETmBT8XVRoiL8U0cAfPGtaVODqO2xINy4gw"),
                  })

S3_BUCKET = Aws::S3::Resource.new.bucket("my-cookbook-photos")
