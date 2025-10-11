import wollok.game.*
import cultivos.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"
    const property listaDeVenta = [] 

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

}