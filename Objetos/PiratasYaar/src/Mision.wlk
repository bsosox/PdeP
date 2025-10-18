class Mision {

    method sirveParaMision(pirata)
    method puedeRealizarBarco(barco)
    method tieneItemsNecesarios(unPirata)
}

class BusquedaDelTesoro inherits Mision {

    var itemsNecesarios = ["brujula", "mapa", "botellaGrogXD"]


    override method sirveParaMision(pirata){
        return self.tieneItemsNecesarios(pirata) && pirata.tieneMenosDeNMonedas(5)
    }

    override method tieneItemsNecesarios(unPirata){
        return itemsNecesarios.any({item => unPirata.tieneItem(item)})
    }

    override method puedeRealizarBarco(barco){
        return barco.algunTripulanteTiene("llaveDeCofre")
    }

}

class ConvertirseEnLeyenda inherits Mision {

    var cantItemsNecesarios = 10
    var itemObligatorio

    override method sirveParaMision(pirata){
        return self.tieneItemsNecesarios(pirata) && (pirata.cuantosItemsTiene() >= 10)
    }

    override method tieneItemsNecesarios(unPirata){
        return unPirata.tieneItem(itemObligatorio)
    }

    override method puedeRealizarBarco(barco){return true} //no hay condicion por lo tanto el metodo retorna true siempre

}

class Saqueo inherits Mision {
    
    var objetivo //puede ser barco o ciudad
    var monedasNecesarias

    method cambiarMonedasNecesarias(nuevaCant){
        monedasNecesarias = nuevaCant
    }

    override method sirveParaMision(pirata){
        return pirata.tieneMenosDeNMonedas(monedasNecesarias) && pirata.seAnimaASaquear(objetivo)
    }
    
    override method puedeRealizarBarco(barco){
        return objetivo.esVulnerablePara(barco) //tengo que hacer class Ciudad y hacerle el metodo
    }
    override method tieneItemsNecesarios(unPirata)
}

