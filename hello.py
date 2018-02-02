from flask import Flask, jsonify, abort, make_response, request
from Service import Service

app = Flask(__name__)
service = Service()

@app.route('/lugares', methods=['GET'])
def get_places():
    return jsonify({'lugares': service.getAll()})

@app.route('/lugares/<int:lugar_id>', methods=['GET'])
def get_place(lugar_id):
    lugar = service.getOne(lugar_id)
    if len(lugar) == 0:
        abort(404)
    return jsonify({'lugar': lugar[0]})

@app.route('/lugares/details', methods=['GET'])
def get_places_details():
    return jsonify({'lugares': service.getAllDetails()})

@app.route('/lugares', methods=['POST'])
def create_place():
    if not request.json:
        abort(400)
    if not 'lugar' in request.json and not 'tipo_lugar_id' in request.json:
        abort(400)
    lugar = service.addPlace(request.json)
    return jsonify({'lugar': lugar}), 201

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

@app.route('/lugares/<int:lugar_id>', methods=['PUT'])
def update_place(lugar_id):
    lugar = service.getOne(lugar_id)
    if len(lugar) == 0:
        abort(404)
    if not request.json:
        abort(400)
    l = service.updatePlace(lugar_id, request.json)
    return jsonify({'lugar': l})

@app.route('/lugares/<int:lugar_id>', methods=['DELETE'])
def delete_place(lugar_id):
    lugar = service.getOne(lugar_id)
    if len(lugar) == 0:
        abort(404)
    l = service.deletePlace(lugar_id)
    return jsonify({'lugar': l})

if __name__ == '__main__':
    app.run(debug=True)
