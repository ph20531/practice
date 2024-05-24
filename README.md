# 그동안 배운 내용들 총 정리
<table style='font-size:8px;'>
    <tr>
        <th>No.</th>
        <th>Category</th>
        <th>Service</th>
        <th>Descriptions</th>
        <th>Library</th>
        <th>Position</th>
    </tr>
    <tr>
        <td>001.</td>
        <td>EDA, AI</td>
        <td>없음</td>
        <td><sub>AWS 서비스가 사용되지는 않았지만 Jupyter notebook과 colab을 사용하여 개발하였다.</sub></td>
        <td>NumPy, Pandas, SciPy, Matplotlib, Seaborn, Keras, TensorFlow, Prophet ...</td>
        <td>Data Analysis, Machine Learning, Deep Learning</td>
    </tr>
    <tr>
        <td>002.</td>
        <td>Database</td>
        <td>Database | AWS RDS<br/>Storage | 자체 Storage</td>
        <td>관계형 데이터베이스 서비스<br/>Relational Database Service</td>
        <td>MySQL, mysql-connector-python, psycopg2-binary ...</td>
        <td>Database Management</td>
    </tr>
    <tr>
        <td>003.</td>
        <td>Client</td>
        <td>Cloud Computing | AWS EC2<br/>Storage | AWS EBS</td>
        <td>AWS EC2 생성 시 AWS EBS 스토리지 용량 설정</td>
        <td>Streamlit, pillow ...</td>
        <td>Front-end</td>
    </tr>
    <tr>
        <td>004.</td>
        <td>Server / API</td>
        <td>Security, Identity, & Compliance | AWS IAM<br/>Cloud Computing | AWS Lambda<br/>Storage | AWS S3</td>
        <td>AWS IAM 사용자 생성 후 serverless로 AWS Lambda에 배포하면 AWS S3에 버킷이 자동으로 생성된다.</td>
        <td>Flask, Flask-JWT-Extended, Flask-Restful, Passlib, Email-validator ...</td>
        <td>Back-end</td>
    </tr>
</table>

# 사용한 개발 도구들
001. vscode
002. jutyper notebook
003. colab
004. mysql workbench
005. postman
006. github desktop
007. putty

# 사용한 라이브러리들
### 001. 데이터 분석(EDA)
001. numpy
002. scipy
003. pandas

### 002. 시각화(Visualization)
004. matplotlib
005. seaborn

### 003. 인공지능(AI)
006. sklearn
007. keras
008. tensorflow
009. prophet

### 004. 클라이언트 어플리케이션(Front-End)
0010. streamlit

#### - 이미지 처리(PIL)
011. pillow

### 005. 데이터베이스(Database)
012. mysql-connector-python

### 006. 서버 어플리케이션(Back-End)
013. flask
014. flask_jwt_extended
015. flask_restfull

#### - 비밀번호 암호화(Encryption & Decryption)
016. psycopg2-binary
017. passlib

#### - 이메일 형식 확인(Email Validator)
018. email-validator

# 사용한 AWS 서비스들
001. RDS
002. EC2
003. IAM
004. Lambda
005. S3

# Streamlit 어플리케이션을 AWS에 배포하는 방법
▶ 참고자료<br/>
https://rudtjr0906.tistory.com/category/AWS

# Flask 어플리케이션을 AWS에 배포하는 방법

## 001. NodeJS 
▶ 먼저 홈페이지에서 NodeJS 설치하기<br/>
https://nodejs.org/en

## 002. AWS IAM 
▶ IAM 서비스에서 사용자 생성을 해야한다.

### - 권한 설정
1. Amazon API Gateway
2. Amazon RDS Data
3. CloudFront
4. IAM (Identity and Access Management)
5. CloudWatch
6. Amazon S3 (Simple Storage Service)
7. AWS CloudFormation
8. AWS Lambda

▶ 사용자 생성을 완료했다면 api_dev_accessKeys.csv파일을 다운로드 받는다.

## 003. Serverless 
▶ Windows CMD를 켜고 serverless를 설치한 후 설정해준다.

```bash
cd C:\Users\406\Documents\GitHub

npm install -g serverless

serverless

serverless config credentials --provider aws --key AKIA6GBMCQLLOXBH474Y --secret 9Ge17YfsBServerless ϟ Framework

√ Select A Template: · AWS / Python / Flask API

√ Name Your Service: · aws-flask-server

√ Create Or Select An Existing App: · Create A New App
√ Name Your New App: · flask-app

√ AWS Credentials Set-Up Method: · Save AWS Credentials in a Local Profile

√ Enter AWS Access Key ID: · AKIA6GBMCQLLOXBH474Y
√ Enter AWS Secret Access Key: · 9Ge17YfsBEZDXrDM9GnPXiEIyzt3uuaQr5VYxrMa
```

## 004. Deploy
▶ 이후 웹 브라우저에서 대시보드가 열린다.<br/>
▶ 구글로 로그인<br/>
https://app.serverless.com/popcorn0508/apps

▶ 그리고 C:\Users\406\Documents\GitHub에 프로젝트가 생성된다.<br/>
▶ 이후 생성된 프로젝트를 vscode에서 open folder한 후에 cmd에서 serverless deploy 또는 sls deploy 명령어를 입력해준다.

▶ 참고로 여기에서 sls는 serverless의 약자이다.

▶ serverless-wsgi 플러그인이 설치되지 않았다는 에러가 발생했을 경우
```bash
npm install serverless-wsgi
```

▶ 이후에 serverless.yml 파일에서 이렇게 되어있으면 설치가 잘 된것이다.
```bash
plugins:
  - serverless-wsgi
```

▶ 만약 EMFILE: too many open files 에러가 발생했을 경우에는 serverless.yml 파일에서 아래의 코드를 맨 밑에 추가해주면 된다.
```bash
package:
  individually: true
  exclude:
    - node_modules/**  # node_modules 폴더와 그 하위 모든 파일 및 디렉토리 제외
    - .git/**  # .git 폴더와 그 하위 모든 파일 및 디렉토리 제외
    - tests/**  # tests 폴더와 그 하위 모든 파일 및 디렉토리 제외
  include:
    - src/**  # src 폴더와 그 하위 모든 파일 및 디렉토리 포함
    - handler.py  # 루트 디렉토리의 handler.py 파일 포함
    - config/**  # config 폴더와 그 하위 모든 파일 및 디렉토리 포함
```

▶ 이제 기존에 개발했던 로컬 API 프로젝트 파일들을 serverless프로젝트로 옮겨주고<br/>
▶ AWS lambda 서비스 환경에 맞게 환경설정을 해주어야 한다.

▶ serverless.yml에서 provider: 부분 수정<br/>
( 참고로 AWS 런타임 환경을 python3.10버전으로, 리전은 아시아 태평양(서울)인 ap-northeast-2로 설정한다는 뜻이다. )
```bash
provider:
  name: aws
  runtime: python3.10
  region: ap-northeast-2
```

▶ requirements.txt에서 아래의 코드를 맨 밑에 추가<br/>
( 참고로 배포 시 사용할 라이브러리를 설치한다는 뜻이다. )
```bash
flask-restful
mysql-connector-python
psycopg-binary
passlib
flask-jwt-extended
email-validator
```

▶ 그리고 serverless deploy명령어로 배포를 하면 잘 된다.
```bash
serverless deploy
```
( 참고로 serverless remove명령어는 배포된 프로젝트를 제거하는 명령어이다. )
```bash
serverless remove
```
▶ 배포가 완료되었다는 로그
```bash
✔ Service deployed to stack aws-flask-server-dev (105s)
```

▶ 마지막으로 endpoints의 url로 API를 사용하면 된다.
```bash
endpoints:
ANY - https://bycew609a0.execute-api.us-east-1.amazonaws.com/dev/
ANY - https://bycew609a0.execute-api.us-east-1.amazonaws.com/dev/{proxy+}
functions:
api: aws-flask-server-dev-api (1.5 MB)
```

## 005. AWS Lambda
▶ 배포된 프로젝트는 AWS Lambda 서비스에서 확인할 수 있다.

## 006. AWS S3
▶ 마찬가지로 AWS S3 서비스에 버킷이 자동으로 생성된다.

# 자동으로 프로젝트 관리되도록 설정하기
## Github Actions를 이용한 CI & CD
### 001. 로컬:push > github:commit > github:actions > aws ec2:pull
▶ 참고자료<br/>
https://rudtjr0906.tistory.com/50

### 002. 로컬:push > github:commit > github:actions > aws lambda:pull
▶ 참고자료<br/>
https://sohyun-lee.tistory.com/entry/%E3%85%8F?category=1063559