from flask import Flask, request, jsonify
from flask_cors import CORS
import logging as log
import mysql.connector

log.basicConfig(level=log.INFO)
app = Flask(__name__)
CORS(app)
 
# Configura la conexión a la base de datos MySQL
db_config = {
    'host': 'mysql',  
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
    
@app.route('/jugador/<int:jugador_id>', methods=['GET'])
def get_rendimiento(jugador_id):
    
    query = "SELECT HistoricoID, FechaRendimiento, Puntuacion FROM HistoricoDeRendimiento, Rendimiento  WHERE HistoricoDeRendimiento.RendimientoID = Rendimiento.RendimientoID and HistoricoDeRendimiento.JugadorID = %s"

    jugador = execute_query(query, (jugador_id,), fetch_one=True)
    if jugador:
        return jsonify(jugador)
    else:
        return jsonify({"message": "Rendimiento no encontrado."}), 404
    

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

@app.route('/jugadores/<int:id_jugador>', methods=['DELETE'])
def borrarJugador(id_jugador):
    # Eliminamos jugador
    query = "DELETE FROM Jugadores WHERE JugadorID = %s"
    params = (id_jugador,)
 
    execute_query(query, params)
    return jsonify({"message": "back_ Jugador borrado de la base de datos."}) , id_jugador
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) #para acceder -> http://127.0.0.1:5000/index