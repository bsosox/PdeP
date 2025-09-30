import src.estado.*

object tamagotchi{
    var estado = contento
    var felicidad = 0
    var comioTriste = 0
    var jugoContento = 0

    method comer(){
        estado.comer(self)
    }

    method jugar(juguete){
        estado.jugar(self, juguete)
    }

    method estado(){
        return estado
    }

    method felicidad() {
      return felicidad
    }
    method cambiarEstado(nuevoEstado){
        estado = nuevoEstado
        comioTriste = 0
        jugoContento = 0
    }

    method poneteContento(){
        self.cambiarEstado(contento)
        comioTriste = 0
    }

    method poneteHambriento() {
        self.cambiarEstado(hambriento)
        comioTriste = 0
    }

    method poneteTriste() {
        self.cambiarEstado(triste)
    }

    method masFelicidad(cantidad){
        felicidad += cantidad
    }

    method comioTriste(){
        comioTriste += 1
        return comioTriste
    }

    method juegaContento(){
        jugoContento += 1
        return jugoContento
    }

}