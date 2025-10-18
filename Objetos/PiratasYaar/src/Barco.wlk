class Barco {

    var mision
    var maxTripulantes
    var tripulantes = #{} // no podria tener un pirata repetido

    method cambiarMision(nuevaMision){
        mision = nuevaMision
        self.actualizarTripulacion() //hay que dejar los tripulantes aptos para mision
    }

    method esTemible(){ return self.puedeRealizarMision()}

    method puedeRealizarMision(){
        return self.tieneSuficienteTripulacion() && mision.puedeRealizarBarco(self)
    }

    method tieneSuficienteTripulacion(){
        return tripulantes.size() > 0.9 * maxTripulantes
    }

    method algunTripulanteTiene(item){
        return tripulantes.any({tripulante => tripulante.tieneItem(item)})
    }

    method puedeFormarParte(pirata){
        return self.hayLugar() && pirata.sirveParaMision(mision)
    }

    method agregarPirata(pirata){
        //no me importa si ya está, no queda repetido
        if(self.puedeFormarParte(pirata)){
            tripulantes.add(pirata)
        } else throw new Exception(message = "PARA LOCO NO ENTRA NADIE MAS!!")
    }

    method actualizarTripulacion(){
        tripulantes.removeAllSuchThat({tripulante => !tripulante.sirveParaMision(mision)})
    }

    method hayLugar(){
        return tripulantes.size() < maxTripulantes
    }

    method quienEstaMasTomado(){
        if(tripulantes.isEmpty()){throw new Exception(message="PARA LOCO NO HAY NADIE TODAVIA!!")}
        
        return tripulantes.asList().sortBy({tripulante1, tripulante2 => (tripulante1 != tripulante2) && tripulante1.estaMasEbrioQue(tripulante2)}).first()
    }

    method esVulnerablePara(otroBarco){
        return maxTripulantes <= otroBarco.cantidadTripulantes()
    }

    method cantidadTripulantes(){
        return tripulantes.size()
    }

    

}