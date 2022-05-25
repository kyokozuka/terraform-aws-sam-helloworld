# Terraform によるSAM(Lambda)とサービスのデプロイ

## RUN

`Makefile`の以下の内容を修正する。

以下の`AWS_POFILE`, `SAM_BUCKET`の値を記述する。
```
AWS_POFILE=
SAM_BUCKET=
SAM_APP_DIR=hello_world
INFRA_DIR=infra
TEMPLATE_FILE=template.yaml
```

`S3Bucket`の作成

~~~
$ make create_bucket
~~~

最初だけ`terraform init`を実行する。
~~~
$ cd infra && terraform init
~~~

トップディレクトリで実行する。

- Deploy
~~~
$ make deploy
~~~

- Destroy
~~~
$ make destroy
~~~