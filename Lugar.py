class Lugar():
    def __init__(self, lugar, tipo_lugar_id, codigo = 'Null', extension = 'Null', latitud = 'Null', longitud = 'Null', padre_id = 'Null'):
        self.lugar_id = 0
        self.lugar = lugar
        self.codigo = 'Null'if codigo == None else codigo
        self.extension = 'Null'if extension == None else extension
        self.latitud = 'Null'if latitud == None else latitud
        self.longitud = 'Null'if longitud == None else longitud
        self.padre_id = 'Null'if padre_id == None else padre_id
        self.tipo_lugar_id = tipo_lugar_id

    def setId(self, lugar_id):
        self.lugar_id = lugar_id

    def setPadreId(self, padre_id):
        self.padre_id = padre_id

    def save(self, mydb):
        cursor = mydb.cursor()
        sql = 'CALL insertar_lugar(\''+self.lugar+'\', '+str(self.codigo)+', '+str(self.extension)+', '+str(self.latitud)+', '+str(self.longitud)+', ' +str(self.padre_id)+', '+str(self.tipo_lugar_id)+', @id);'
        cursor.execute(sql)
        cursor.execute('SELECT @id')
        result = cursor.fetchall()
        self.lugar_id = result[0][0]
        mydb.commit()
        return self.toJson()

    def update(self, mydb):
        cursor = mydb.cursor()
        sql = 'CALL actualizar_lugar('+str(self.lugar_id)+',\''+self.lugar+'\', '+str(self.codigo)+', '+str(self.extension)+', '+str(self.latitud)+', '+str(self.longitud)+', ' +str(self.padre_id)+', '+str(self.tipo_lugar_id)+');'
        cursor.execute(sql)
        mydb.commit()
        return self.toJson()

    def delete(self, mydb):
        cursor = mydb.cursor()
        sql = 'DELETE FROM lugares WHERE lugar_id = '+str(self.lugar_id)+';'
        cursor.execute(sql)
        mydb.commit()

    def toJson(self):
        return {
                'id' : self.lugar_id,
                'lugar' : self.lugar,
                'codigo' : None if self.codigo == "Null" else self.codigo,
                'extension' : None if self.extension == "Null" else self.extension,
                'latitud' : None if self.latitud == "Null" else self.latitud,
                'longitud' : None if self.longitud == "Null" else self.longitud,
                'padre_id' : None if self.padre_id == "Null" else self.padre_id,
                'tipo_lugar_id' : self.tipo_lugar_id
            }
    
    @staticmethod
    def getAll(mydb):
        lugares = []
        cursor = mydb.cursor()
        cursor.execute('SELECT lugar_id, lugar, codigo, extension, latitud, longitud, padre_id, tipo_lugar_id FROM LUGARES;')
        places = cursor.fetchall()
        for lugar in places:
            new = {
                'id' : lugar[0],
                'lugar' : lugar[1],
                'codigo' : lugar[2],
                'extension' : lugar[3],
                'latitud' : lugar[4],
                'longitud' : lugar[5],
                'padre_id' : lugar[6],
                'tipo_lugar_id' : lugar[7]
            }
            lugares.append(new)
        return lugares

    @staticmethod
    def getOne(lugar_id, mydb):
        cursor = mydb.cursor()
        cursor.execute('SELECT lugar_id, lugar, codigo, extension, latitud, longitud, padre_id, tipo_lugar_id FROM LUGARES;')
        lugar = cursor.fetchall()
        one = {
                'id' : lugar[0][0],
                'lugar' : lugar[0][1],
                'codigo' : lugar[0][2],
                'extension' : lugar[0][3],
                'latitud' : lugar[0][4],
                'longitud' : lugar[0][5],
                'padre_id' : lugar[0][6],
                'tipo_lugar_id' : lugar[0][7]
            }
        return one

    def __str__(self):
        return self.toJson()
