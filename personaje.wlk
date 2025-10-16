import wollok.game.*
import cultivos.*
import aspersor.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"
    const property listaDeVenta = [] 
    var property cantidadDeMonedas = 0
    const property aspersores = []

    method sembrarMaiz() {
    self.validarPoderPlantar()
    game.addVisual(new Maiz(position = self.position()))

    }

    method sembrarTrigo() {
    self.validarPoderPlantar()
    game.addVisual(new Trigo(position = self.position()))

    }

    method sembrarTomaco() {
    self.validarPoderPlantar()
    game.addVisual(new Tomaco(position = self.position()))

    }

    method objetoEncima() {
        var obj = game.getObjectsIn(position)
        obj.remove(self)
        return obj 
    }

    method validarPoderPlantar() {
        if (not self.objetoEncima().isEmpty())
            {self.error("¡Ya hay algo plantado!")}
    }

    method regar() {
        self.objetoEncima().first().regar()
    }

    method cosechar() {
        self.validarPoderCosechar()
        self.objetoEncima().first().cosechar()
    }

    method validarPoderCosechar() {
        if (self.objetoEncima().isEmpty())
            {self.error("No tengo nada para cosechar")}
    }

    method vender() {
        self.validarPoderVender1()
        self.validarPoderVender2()
        const mercadoActual = self.mercadoEnMiPosicion()
        const precioTotal = self.precioTotalDeVenta()
        mercadoActual.comprar(self.listaDeVenta(), precioTotal)
        self.recibirPago(precioTotal)
        self.listaDeVenta().clear()
    }

    method mercadoEnMiPosicion() {
        var obj = game.getObjectsIn(self.position())
        obj.remove(self)
        return obj.find({unObjeto => unObjeto.esUnMercado()})
    }

    method recibirPago(cantidad) {
        cantidadDeMonedas += cantidad
    }

    method precioTotalDeVenta() {
        return self.listaDeVenta().sum({unCultivo => unCultivo.precio()})
    }

    method validarPoderVender1() {
        if (not self.estoyEnUnMercado())
            {self.error("No puedo vender, no estoy en un mercado")}
    }

    method estoyEnUnMercado() {
        return game.getObjectsIn(self.position()).any({objeto => objeto.esUnMercado()})
    }

    method validarPoderVender2() {
        var mercadoEnMiPos = self.mercadoEnMiPosicion()
        if (not (mercadoEnMiPos.monedas() >= self.precioTotalDeVenta()))
            {self.error("El mercado no tiene suficientes monedas")}
    }

    method texto() {
        return "Tengo " + self.cantidadDeMonedas() + " monedas, y " + self.listaDeVenta().size() + " plantas para vender"
    }

    method ponerAspersor() {
        const aspersor = new Aspersor(position = self.position())
        game.addVisual(aspersor)
        aspersores.add(aspersor)
    }

    method activarAspersor() {
      aspersores.forEach({aspersor => aspersor.regarTodo()})
    }
    
    method esUnMercado() {
        return false
    }

}
