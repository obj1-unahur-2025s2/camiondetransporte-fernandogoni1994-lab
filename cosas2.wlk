object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method esPesoPar() = self.peso().even()
    method bultos() = 1 
    method consecuenciasDeLaCarga() {}


}


object bumblebee{
    var esAuto = false

    method peso() = 800
    method esPesoPar() = self.peso().even()
    method peligrosidad() = if(esAuto) 15 else 30
    method bultos() = 2

    method consecuenciasDeLaCarga(){
        self.transformateEnRobot()
    }

    method transformateEnAuto(){
        esAuto = true
    }

    method transformateEnRobot(){
        esAuto = false
    }

}
    

object ladrillos{
    var cantidad = 10
    method esPesoPar() = self.peso().even()
    method peso() = 2 * cantidad
    method bultos() = if(cantidad <= 100) 1 else if(cantidad.between(101, 300)) 2 else 3
    
    method consecuenciasDeLaCarga(){
     cantidad += 12
    }    

    method cantidad(nuevaCantidad){
        cantidad = nuevaCantidad.max(0)
    }

    method peligrosidad() = 2

}


object arena{
    var property peso = 0 //Solo hacer property en caso de que tengamos que consultarlo y setearlo.
    method esPesoPar() = self.peso().even()
    method peligrosidad() = 1
    method bultos() = 1
    method consecuenciasDeLaCarga(){
        peso = (peso - 10).max(0)
    }

}


object bateria{
    var esConMisil = false
    method esPesoPar() = self.peso().even()
    method cargaMisil(){
        esConMisil = true
    }

    method descargaMisil(){
        esConMisil = false
    }

    method consecuenciasDeLaCarga(){
        self.cargaMisil()
    }
      

    method peso() = if(esConMisil) 300 else 200

    method peligrosidad() = if(esConMisil) 100 else 0

}


object contenedor{
    method esPesoPar() = self.peso().even()
    const cosasAdentro =[]

    method bultos() = 1 + cosasAdentro.sum({cosas => cosas.bultos()})

    method agregar(unaCosa){
        cosasAdentro.add(unaCosa)
    }

    method agregarVariasCosas(variasCosas){
        cosasAdentro.addAll(variasCosas)
    }

    method quitarCosa(unaCosa){
        cosasAdentro.remove(unaCosa)
    }

    method consecuenciasDeLaCarga(){
        if(cosasAdentro.isEmpty()){
        }
        else
        cosasAdentro.forEach({cosas => cosas.peligrosidad()})
    }
    
    method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()})
    method peligrosidad() = 
    if(cosasAdentro.isEmpty()) 0 
    else cosasAdentro.max({cosa => cosa.peligrosidad().peligrosidad()}) //Retorna el elemento cuya peligrosidad es la maxima, y luego de ese objeto pide el valor de esa peligrosidad

}

object residuos{
    var property peso = 0
    method peligrosidad() = 200
    method esPesoPar() = self.peso().even()
    method bultos() = 1
    method consecuenciasDeLaCarga(){
        peso += 15
    }
}


object embalaje{
    var cosaEnvuelta = nada
    method esPesoPar() = self.peso().even()
    method envolverUnaCosa(unaCosa){
        cosaEnvuelta = unaCosa
    }
    method bultos() = 2
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2 
    method consecuenciasDeLaCarga(){}
}

object nada{
    method esPesoPar() = self.peso().even()
    method peso() = 0
    method peligrosidad() = 0
}


