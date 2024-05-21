from flask import Flask
from flask_restful import Api

# flask와 flask-restful 라이브러리 설치
# flask run 명령어로 실행이 안될 경우
# set FLASK_APP=003_FLASK\app.py 명령어로 패스 설정

from resources.resource import BaseHTTPResource, RecipesResource, RecipesByIdResource, RecipesPublishByIdResource

# 파이썬 전용 mysql connector 라이브러리
# mysql-connector-python

# 비밀번호 암호화 라이브러리
# psycopg2-binary
# passlib

# 이메일 형식이 올바른지 체크해주는 라이브러리
# email-validator

app = Flask(__name__)

api = Api(app)

api.add_resource(BaseHTTPResource, '/default')
api.add_resource(RecipesResource, '/recipes')
api.add_resource(RecipesByIdResource, '/recipes/<int:recipe_id>')
api.add_resource(RecipesPublishByIdResource, '/recipes/<int:recipe_id>/publish')

if __name__ == '__main__':
    app.run()