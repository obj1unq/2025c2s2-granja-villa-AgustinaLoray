import wollok.game.*
import personaje.*
import cultivos.*

class Aspersor {
    var property image = "aspersor.png"
    var property position = game.at(personaje.position().x(), personaje.position().y()) 
    const property direccionesLimitrofes = []

    method initialize() {
        self.direccionesLimitrofes().clear()
        self.direccionesLimitrofes().addAll(
            [
            game.at(position.x(), position.y()+1),    // norte
            game.at(position.x()+1, position.y()+1),  // noroeste
            game.at(position.x() +1, position.y()),   // oeste
            game.at(position.x()+1, position.y()-1),  // suroeste
            game.at(position.x(), position.y()-1),    // sur
            game.at(position.x()-1, position.y()-1),  // sureste
            game.at(position.x()-1,position.y()),     // este
            game.at(position.x()-1, position.y()+1)   // noreste
            ]
           )

    }

    method regarHacia(direccion) {
        var objs = game.getObjectsIn(direccion)
        if (not objs.isEmpty()) {
            objs.first().regar()
        }
    }

    method regarTodo(){
        direccionesLimitrofes.forEach({direccion => self.regarHacia(direccion) })
    }

    method esUnMercado() {
        return false
    }

    method regar() {
        var mensaje = "No se puede regar con un aspersor al lado de otro"
        game.say(personaje, mensaje)
    }
}