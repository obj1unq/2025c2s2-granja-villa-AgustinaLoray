import wollok.game.*
import cultivos.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"

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

    method validarPoderPlantar() {
        var objetos = game.getObjectsIn(position)
        objetos.remove(self)
        if (not objetos.isEmpty())
            {self.error("¡Ya hay algo plantado!")}

    }

    method cultivosEnMiPosicion() {
        var cultivos = game.getObjectsIn(position)
        cultivos.remove(self)
        return cultivos
    }

    method regar(cultivo) {
        cultivo.regar()

    }

}