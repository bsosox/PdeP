class EnfermedadInfecciosa {
  var celulasAmenazadas

  method celulasAmenazadas() = celulasAmenazadas
  method esAgresivo(persona) = persona.celulas() * 0.1 <= self.celulasAmenazadas()
  method afectar(alguien) { 
    alguien.aumentarTemperatura(celulasAmenazadas / 1000)
  }
  method reproducite() {
    celulasAmenazadas *= 2
  }
}

// es una enfermedad autoinmune, pero es la única, así que por ahora nos alcanza con modelar esta sola
object lupus {
  var cantidadDeAfecciones = 0

  method afectar(alguien) {
    alguien.destruirCelulas(10000)
    cantidadDeAfecciones += 1
  }

  method esAgresivo(_persona) = cantidadDeAfecciones > 30

  method celulasAmenazadas() = 10000
}

