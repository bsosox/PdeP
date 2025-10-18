
class Paciente {
  const enfermedades
  var temperatura = 36
  var celulas

  method vivirUnDia() {
    enfermedades.forEach({ enfermedad => enfermedad.afectar(self) })
  }

  method aumentarTemperatura(unaCantidad) {
    temperatura = (temperatura + unaCantidad).min(45)
  }

  method destruirCelulas(unaCantidad) {
    celulas = (celulas - unaCantidad).max(0)
  }

  method cantidadDeCelulasAmenazadasPorEnfermedadesAgresivas() = enfermedades
    .filter({ enfermedad => enfermedad.esAgresivo(self) })
    .sum({ enfermedad => enfermedad.celulasAmenazadas() })

  method enfermedadQueMasCelulasAfecta() = lupus
  method estaEnComa() = temperatura == 45 or celulas < 1000000

  method temperatura() = temperatura

  method celulas() = celulas

  method contraer(enfermedad) {
    enfermedades.add(enfermedad)
  }
}