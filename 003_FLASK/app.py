from flask import Flask
from flask_restful import Api

# flask와 flask-restful 라이브러리 설치
# flask run 명령어로 실행이 안될 경우
# set FLASK_APP=003_FLASK\app.py 명령어로 패스 설정

from resources.resource import DefaultResource, RecipesResource

# mysql-connector-python 라이브러리 설치

app = Flask(__name__)

api = Api(app)

api.add_resource(DefaultResource, '/default')
api.add_resource(RecipesResource, '/recipes')

if __name__ == '__main__':
    app.run()