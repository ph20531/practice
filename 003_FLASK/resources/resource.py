from flask import request
from flask_restful import Resource
from mysql_connection import getConnection
from mysql.connector import Error
from utils import toISOFormat

# Basics ________________________________________________________________________________
# CREATE | POST
# READ   | GET
# UPDATE | PUT
# DELETE | DELETE

# Inputs ________________________________________________________________________________
# URL
# - URL은 보통 Argument로 사용

# Body
# - body는 보통 POST, PUT, PATCH에 사용
# - data = request.get_json()

# Params
# - params는 보통 GET에 사용
# - data = request.args

# Execute _______________________________________________________________________________
# GET, DELETE
# - cursor.execute(query)

# POST, PUT
# - cursor.execute(query, args)

class BaseHTTPResource(Resource):
    def post(self):
        return {
            'data':'CREATE | POST'
            }

    def get(self):
        return {
            'data':'READ | GET'
            }
    
    def put(self):
        return {
            'data':'UPDATE | PUT'
            }
    
    def delete(self):
        return {
            'data':'DELETE | DELETE'
            }
    
class RecipesByIdResource(Resource):
    def get(self, recipe_id):
        try:
            connection = getConnection()

            query = f'''SELECT * FROM recipe WHERE id = {recipe_id};'''

            cursor = connection.cursor(dictionary=True)

            cursor.execute(query)
            result = cursor.fetchall()
            result = toISOFormat(result, 'created_at', 'updated_at')

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return {
                'result':'fail',
                'error':str(e)
                }
        
        if len(result) <= 0:
            # ERROR | 500
            return {
                'result':'fail',
                'error':'This item does not exist.'
                }
        
        # SUCCESS | 200
        return {
            'result':'success',
            'items':result,
            'count':len(result)
            }
    
    def put(self, recipe_id):
        # - body
        data = request.get_json()

        # - database
        try:
            connection = getConnection()

            query = '''UPDATE recipe SET '''
            args = []
            for key, value in data.items():
                query += f"{key} = %s, "
                args.append(value)

            query = query[:-2] + f" WHERE id = %s;"
            args.append(recipe_id)

            cursor = connection.cursor()

            cursor.execute(query, tuple(args))
            connection.commit()

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return {
                'result': 'fail',
                'error': str(e)
            }
        
        # SUCCESS | 200
        return {
            'result': 'success'
        }
    
    def delete(self, recipe_id):
        try:
            connection = getConnection()

            query = f'''DELETE FROM recipe WHERE id = {recipe_id};'''

            cursor = connection.cursor()

            cursor.execute(query)
            connection.commit()

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return {
                'result':'fail',
                'error':str(e)
                }
        
        # SUCCESS | 200
        return {
            'result':'success'
            }
    
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
            return {
                'result':'fail',
                'error':str(e)
                }
        
        # SUCCESS | 200
        return {
            'result':
            'success'
            }
    
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
            result = toISOFormat(result, 'created_at', 'updated_at')

            cursor.close()
            connection.close()
        except Error as e:
            if cursor is not None:
                cursor.close()

            if connection is not None:
                connection.close()

            # ERROR | 500
            return {
                'result':'fail',
                'error':str(e)
                }
        
        # SUCCESS | 200
        return {
            'result':'success',
            'items':result,
            'count':len(result)
            }