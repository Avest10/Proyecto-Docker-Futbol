from flask import Flask, request, jsonify
from flask_cors import CORS
import logging as log
import mysql.connector

log.basicConfig(level=log.INFO)
app = Flask(__name__)
CORS(app)
 
# Configura la conexión a la base de datos MySQL
db_config = {
    'host': 'mysql',  # Definido en el docker-compose en la sección posterior
    'user': 'root',
    'password': 'ejemplo',
    'database': 'mydatabase'
}
 
def execute_query(query, params=None, fetch_one=False):
    try:
        # Conecta a la base de datos MySQL
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
 
        # Ejecuta la consulta
        cursor.execute(query, params)
 
        if fetch_one:
            result = cursor.fetchone()
        else:
            result = cursor.fetchall()
 
        # Realiza commit y cierra la conexión
        conn.commit()
        conn.close()
 
        return result
 
    except Exception as e:
        log.warning("Error executing query: %s" % e)
        return None
    
@app.route('/jugadores', methods = ['GET'])
def getJugadores():
    query = "SELECT * FROM Jugadores"
    jugadores = execute_query(query)
    
    if jugadores:
        return jsonify(jugadores)
    else: 
        return jsonify({"message": "Error al obtener los jugadores."}), 500
    
@app.route('/jugadores/<int:id_equipo>', methods = ['GET'])
def getJugadorEquipo(id_equipo):
    query = "SELECT * FROM Jugadores WHERE JugadorID = %s"
    jugadores = execute_query(query, (id_equipo,), fetch_one = True)
    
    if jugadores:
        return jsonify(jugadores)
    else: 
        return jsonify({"message": "Error al obtener los jugadores."}), 404
    

@app.route('/jugadores', methods=['POST'])
def nuevo_jugador():
    # Crea una nueva consulta
    data = request.get_json()
    JugadorID = data.get('JugadorID')
    NombreJugador = data.get('NombreJugador')
    EquipoID = data.get('EquipoID')
 
    query = "INSERT INTO Jugadores (JugadorID, NombreJugador, EquipoID) VALUES (%s, %s, %s)"
    params = (JugadorID, NombreJugador, EquipoID)
   
    execute_query(query, params)
    return jsonify({"message": "Jugador añadido con éxito."})
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) #para acceder -> http://127.0.0.1:5000/index