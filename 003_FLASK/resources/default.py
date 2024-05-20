from flask import request, jsonify
from flask_restful import Resource

# CREATE | POST
# READ   | GET
# UPDATE | PUT
# DELETE | DELETE

class DefaultResource(Resource):
    def post(self):
        return {'data' : 'CREATE | POST'}

    def get(self):
        return {'data' : 'READ | GET'}
    
    def put(self):
        return {'data' : 'UPDATE | PUT'}
    
    def delete(self):
        return {'data' : 'DELETE | DELETE'}

# Inputs
# params는 보통 GET
# body는 보통 POST, PUT, PATCH
class RecipesResource(Resource):
    def post(self):
        # - body
        data = request.json        
        return jsonify({'received_data' : data})
    
        # - params
        # key = data.get('key')
        # return jsonify({'received_data': key})