import cosas.*
object camion {
    const carga = []

    method cargar(unaCosa) {
        carga.add(unaCosa)
    }

    method descargar(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + carga.sum({cosa => cosa.peso()}) //Suma: se usa sum()

    method todoPesoEsPar() = carga.all({cosa => cosa.esPesoPar()}) //Todo/todas: se usa all() 

    method algunaCosaPesa(unPeso) = carga.any({cosa => cosa.peso() == unPeso}) //Alguna cosa: se usa any()   

    method primerCosaConPeligrosidad(unValor) = carga.find({cosa => cosa.peligrosidad() == unValor}) //La primer cosa o una sola cosa: se usa find()

    method todasLasCosasConMasPeligrosidad(unValor) = carga.filter({cosa => cosa.peligrosidad() > unValor})  //Que toda la coleccion cumpla una condicion: se usa filter()

    method cosasSuperanOeligrosidadDe(unaCosa) = carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})  //Que toda la coleccion cumpla una condicion: se usa filter()

    method pesoExcedido() = self.pesoTotal() > 2500

    method puedeCircular(nivelMaximo) = not self.pesoExcedido() && self.todasLasCosasConMasPeligrosidad(nivelMaximo).isEmpty()

    method algunaCosaQuePesaEntreUnValor(valorMinimo,valorMaximo) = carga.any({cosa => cosa.peso().between(valorMinimo,valorMaximo)}) 

    method laCosaMasPesada() = carga.max({cosa => cosa.peso()})
}

