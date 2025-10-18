import src.Barco.*
class Pirata {
    
    var items = []
    var ebriedad
    var dinero

    method sirveParaMision(mision){
        return mision.sirveParaMision(self)
    }

    method estaMasEbrioQue(otroPirata){
        return self.ebriedad() > otroPirata.ebriedad()
    }

    method ebriedad(){
        return ebriedad
    }

    method tieneMenosDeNMonedas(cantidad){
        return dinero < 5
    }

    method tieneItem(item){
        return items.contains(item)
    }

    method seAnimaASaquear(objetivo) {
        if(objetivo.className() == Barco){
            return self.seAnimaASaquearBarco()
        } else {
            return self.seAnimaASaquearCiudad()
        }
    }

    method seAnimaASaquearBarco(){
        return self.masEbrioQue(90)
    }
    method seAnimaASaquearCiudad(){
        return self.masEbrioQue(50)
    }
    method masEbrioQue(num){
        return self.ebriedad() > num
    }

}