import wollok.game.*
import personaje.*

class Maiz {
    var property position = game.at(1, 1)
    var property esBebe = true 
    var property image = "corn_baby.png" 
    const property precio = 150

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

    method esVendida() {
        return self.precio()
    }

    method esUnMercado() {
        return false
    }
}

class Trigo {
    var property position = game.at(1, 1)
    var property etapaDeEvolucion = 0 

    method precio() {
        return (etapaDeEvolucion - 1) * 100
    }
    
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

    method esVendida() {
        return self.precio()
    }

    method esUnMercado() {
        return false
    }

}

class Tomaco {
    var property position = game.at(1, 1)
    var property image = "tomaco.png" 
    const property precio = 80

    method regar() {
        if (position.y() == 9)
            {position = game.at(position.x(), 0)}
        else { position = game.at(position.x(), position.y() + 1) }
    }

    method cosechar() {
        personaje.listaDeVenta().add(self)
        game.removeVisual(self)
    }

    method esVendida() {
        return self.precio()
    }

    method esUnMercado() {
        return false
    }
}