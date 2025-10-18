import src.Enfermedad.*
import src.Paciente.*


// Logan, con temperatura normal (36 grados) y con 3.000.000 de células, habiendo contraído las tres enfermedades del ítem a).
const logan = new Paciente(enfermedades = #{malaria500, otitis100, lupus}, celulas = 3000000)
// Frank, coperatura normal y 3.500.000 células.n tem
const frank = new Paciente(enfermedades = #{}, celulas = 3500000)

const malaria500 = new EnfermedadInfecciosa(celulasAmenazadas = 500)
const malaria800 = new EnfermedadInfecciosa(celulasAmenazadas = 800)
const otitis100 = new EnfermedadInfecciosa(celulasAmenazadas = 100)



// todos los bloques son objetos que entienden el método apply, por lo tanto este objeto
// es polimórfico con los bloques y puedo usarlos en el forEach, map, filter y otros métodos de orden superior sobre listas
object miApply {
  method apply(enfermedad) {
    enfermedad.afectar(logan)
  }
}