CREATE EXTERNAL TABLE cloudtrail_logs (
  eventVersion STRING,
  userIdentity STRUCT<
      type: STRING,
      principalId: STRING,
      arn: STRING,
      accountId: STRING,
      invokedBy: STRING,
      accessKeyId: STRING,
      userName: STRING,
      sessionContext: STRUCT<
          attributes: STRUCT<
              mfaAuthenticated: STRING,
              creationDate: STRING>,
          sessionIssuer: STRUCT<
              type: STRING,
              principalId: STRING,
              arn: STRING,
              accountId: STRING,
              userName: STRING>>>,
  eventTime STRING,
  eventSource STRING,
  eventName STRING,
  awsRegion STRING,
  sourceIpAddress STRING,
  userAgent STRING,
  errorCode STRING,
  errorMessage STRING,
  requestParameters STRING,
  responseElements STRING,
  additionalEventData STRING,
  requestId STRING,
  eventId STRING,
  resources ARRAY<STRUCT<
      arn: STRING,
      accountId: STRING,
      type: STRING>>,
  eventType STRING,
  apiVersion STRING,
  readOnly STRING,
  recipientAccountId STRING,
  serviceEventDetails STRING,
  sharedEventID STRING,
  vpcEndpointId STRING
)
COMMENT 'CloudTrail table'
ROW FORMAT SERDE 'com.amazon.emr.hive.serde.CloudTrailSerde'
STORED AS INPUTFORMAT 'com.amazon.emr.cloudtrail.CloudTrailInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://${cloudtrail_bucket_name}/AWSLogs/${aws_account_id}/CloudTrail/'
TBLPROPERTIES ('classification'='cloudtrail');