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
        return jsonify({
            'data':'CREATE | POST'
            })

    def get(self):
        return jsonify({
            'data':'READ | GET'
            })
    
    def put(self):
        return jsonify({
            'data':'UPDATE | PUT'
            })
    
    def delete(self):
        return jsonify({
            'data':'DELETE | DELETE'
            })

# Inputs
# body는 보통 POST, PUT, PATCH
# params는 보통 GET
class RecipesResource(Resource):
    def post(self):
        # - body
        data = request.get_json()

        # - database
        try:
            connection = getConnection()

            query = '''INSERT INTO recipe (name, description, num_of_servings, cook_time, directions) VALUES (%s, %s, %s, %s, %s);'''
            args = (data['name'], data['description'], data['num_of_servings'], data['cook_time'], data['directions'])

            cursor = connection.cursor()

            cursor.execute(query, args)
            connection.commit()

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return jsonify({
                'result':'fail',
                'error':str(e)
                })
        
        # SUCCESS | 200
        return jsonify({
            'result':
            'success'
            })
    
    def get(self):
        # - params
        data = request.args
        offset = data['offset']
        limit = data['limit']

        try:
            connection = getConnection()

            query = f'''SELECT * FROM recipe LIMIT {offset}, {limit};'''

            cursor = connection.cursor(dictionary=True)

            cursor.execute(query)
            result = cursor.fetchall()

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return jsonify({
                'result':'fail',
                'error':str(e)
                })
        
        # datetime을 iso형식으로 포맷
        index = 0
        for row in result :
            result[index]['created_at'] = row['created_at'].isoformat()
            result[index]['updated_at'] = row['updated_at'].isoformat()
            index = index + 1

        # SUCCESS | 200
        return jsonify({
            'result':'success',
            'items':result,
            'count':len(result)
            })