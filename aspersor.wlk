import wollok.game.*
import personaje.*
import cultivos.*

class Aspersor {
    var property image = "aspersor.png"
    var property position = game.at(personaje.position().x(), personaje.position().y()) 
    const property direccionesLimitrofes = []

    method initialize() {
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
        const objeto = game.getObjectsIn(direccion).first()
        objeto.regar()
    }

    method regarTodo(){
        direccionesLimitrofes.forEach({direccion => self.regarHacia(direccion) })
    }
}
