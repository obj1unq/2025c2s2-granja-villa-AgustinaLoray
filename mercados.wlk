import wollok.game.*
import personaje.*
import cultivos.*

class Mercado {
    var property image =  "market.png"
    var property monedas = 0
    var property mercaderia = [] 
    var property position = game.center()

    method esUnMercado() {
        return true
    }
  
    method comprar(items, precioTotal) {
        self.mercaderia().addAll(items)
        monedas -= precioTotal
    }
}
