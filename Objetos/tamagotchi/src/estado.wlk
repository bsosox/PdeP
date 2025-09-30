import src.juguete.*
import src.tamagotchi.*

object contento {


    method comer(unTamagotchi){
        unTamagotchi.masFelicidad(1)
    }

    method jugar(unTamagotchi, unJuguete) {
        var jugoContento = unTamagotchi.juegaContento()
        if (jugoContento >= 3){
            unTamagotchi.poneteHambriento()
        }
        unJuguete.recibirDanio(1)
        unJuguete.juegaContento(unTamagotchi)
    }

}

object hambriento {
    
    method comer(unTamagotchi) {
        unTamagotchi.poneteContento()
    }

    method jugar(unTamagotchi, unJuguete) {
        if(unJuguete == ratonDeGoma) { 
            unTamagotchi.poneteContento()
            unJuguete.recibirDanio(15)
        } else {
            unTamagotchi.menosFelicidad(4)
        }
    
    }

}

object triste {
    
    method comer(unTamagotchi) {
        var comioTriste = unTamagotchi.comioTriste()
        if(comioTriste == 3){
            unTamagotchi.poneteContento()
        }
    }

    method jugar(unTamagotchi, unJuguete) {
        unTamagotchi.poneteContento()
        unJuguete.recibirDanio(unTamagotchi.felicidad()) 
    }

  
}