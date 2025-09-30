import src.tamagotchi.*

object pelota {

    var danio = 0

    method recibirDanio(cantidad) {
        danio += cantidad
    }

    method juegaContento(unTamagotchi) {
        unTamagotchi.masFelicidad(5)
    }

}

object piedra {
    var danio = 0
    method recibirDanio(cantidad) {
        danio += cantidad
    }
    method juegaContento(unTamagotchi) {
        unTamagotchi.poneteTriste()
    }
}

object ratonDeGoma {
    var danio = 0
    method recibirDanio(cantidad) {
        danio += cantidad
    }
    method juegaContento(unTamagotchi) {
        unTamagotchi.masFelicidad(3)
        unTamagotchi.poneteHambriento()
    }
}