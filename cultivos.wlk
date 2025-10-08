import wollok.game.*
import personaje.*

class Maiz {
    var property position = game.at(1, 1)
    var property esBebe = true 
    var property image = "corn_baby.png" 

    method regar() {
        if (esBebe)
        {image = "corn_adult.png"
            esBebe = false }
    }

    method cosechar() {
        if (not esBebe)
        { personaje.listaDeVenta().add(self)
          game.removeVisual(self) }
    }
}

class Trigo {
    var property position = game.at(1, 1)
    var property etapaDeEvolucion = 0 
    
    method image() = "wheat_" + etapaDeEvolucion + ".png" 

    method regar() {
        if (etapaDeEvolucion == 3)
            {etapaDeEvolucion = 0}
        else {etapaDeEvolucion += 1}
    }

    method cosechar() {
        if (etapaDeEvolucion == 2 || etapaDeEvolucion == 3)
            { personaje.listaDeVenta().add(self)
              game.removeVisual(self)}
      
    }

}

class Tomaco {
    var property position = game.at(1, 1)
    var property image = "tomaco.png" 

    method regar() {
        if (position.y() == 9)
            {position = game.at(position.x(), 0)}
        else { position = game.at(position.x(), position.y() + 1) }
    }
}