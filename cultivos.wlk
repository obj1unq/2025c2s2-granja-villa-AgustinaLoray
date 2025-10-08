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
}

class Trigo {
    var property position = game.at(1, 1)
    method image() {
        return "wheat_0.png"
    }

    method regar() {

    }

}

class Tomaco {
    var property position = game.at(1, 1)
    method image() {
        return "tomaco.png"
    }

    method regar() {

    }
}