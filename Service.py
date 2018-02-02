from Lugar import Lugar
import MySQLdb

class Service():
    def __init__(self):
        self.mydb = MySQLdb.connect(host = 'localhost', user = 'root', password = '', db = 'places')
        self.lugares = Lugar.getAll(self.mydb)

    def getAll(self):
        return self.lugares

    def getOne(self, lugar_id):
        return [lugar for lugar in self.lugares if lugar['id'] == lugar_id]

    def addPlace(self, json):
        lugar = Lugar(json['lugar'], json['tipo_lugar_id'], json['codigo'], json['extension'], json['latitud'], json['longitud'], json['padre_id'])
        lugar.save(self.mydb)
        self.lugares.append(lugar.toJson())
        return lugar.toJson()

    def updatePlace(self, lugar_id, json):
        lugar = Lugar(json['lugar'], json['tipo_lugar_id'], json['codigo'], json['extension'], json['latitud'], json['longitud'], json['padre_id'])
        lugar.setId(lugar_id)
        i = self.lugares.index(self.getOne(lugar_id)[0])
        self.lugares[i] = lugar.update(self.mydb)
        return self.lugares[i]

    def deletePlace(self, lugar_id):
        json = self.getOne(lugar_id)[0]
        lugar = Lugar(json['lugar'], json['tipo_lugar_id'], json['codigo'], json['extension'], json['latitud'], json['longitud'], json['padre_id'])
        lugar.setId(lugar_id)
        lugar.delete(self.mydb)
        self.lugares.remove(json)
        return 'deleted'
        
