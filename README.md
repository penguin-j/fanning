# fanning
ファイル添付メール送信APIのRuby実装サンプル

## Feature
POSTリクエストでfrom_address, to_address, 本文などを渡すことで、メールを送信することができます  
ファイルを配置してパスを指定すれば、ファイル添付メールを送信することもできます
```request.json
{
    "fromAddress":"from@example.com",
    "toAddresses":[
        "to@example.com"
    ],
    "subject":"Here is a subject.",
    "body":"Here is a body.",
    "contentType":"text/plain",
    "mimeVersion":"1.0",
    "filePath":"quick_start/attachment.txt"
}
```
SES clientやSMTP関連の実装はwrapしてあります

## Development
serverless-offline
- serverless applicationをローカルで実行できます

localstack
- AWSサービス（今回はAmazon SES）をローカルでMockできます