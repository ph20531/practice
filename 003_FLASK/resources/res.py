from flask import request, jsonify
from flask_restful import Resource
from mysql_connection import getConnection
from mysql.connector import Error

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
        data = request.get_json()

        # - params
        # key = data.get('key')

        # - database
        try:
            connection = getConnection()

            query = '''INSERT INTO recipe (name, description, num_of_servings, cook_time, directions) VALUES (%s, %s, %s, %s, %s);'''
            params = (data['name'], data['description'], data['num_of_servings'], data['cook_time'], data['directions'])

            cursor = connection.cursor()

            cursor.execute(query, params)
            connection.commit()

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return jsonify({'result':'fail', 'error':str(e)})
        
        # SUCCESS | 200
        return jsonify({'result':'success'}) # 200