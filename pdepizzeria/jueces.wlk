import pdepizzeria.pizza.*
class Juez {
    var ingredienteQueNoGusta

    method pizzaVetable(pizza) = self.tieneUnIngredienteNoGustado(pizza) or pizza.estaCruda()
    method tieneUnIngredienteNoGustado(pizza) = pizza.tieneIngrediente(ingredienteQueNoGusta)
    
    method puntuarPizza(pizza)
    method juzgarPizza(pizza) = 1.min(0.max(self.puntuarPizza(pizza)))
}

object zeff inherits Juez(ingredienteQueNoGusta="atun") {
    override method puntuarPizza(pizza) {
        return pizza.masa()/pizza.masaInicial()
    }

}

object anton inherits Juez(ingredienteQueNoGusta="morrones") {
    override method pizzaVetable(pizza) = super(pizza) or pizza.masa() < 400
    override method puntuarPizza(pizza) {
        var puntaje = 1
        if(pizza.estaQuemada()){
            puntaje -=0.5
        }
        else if(pizza.estaCargada()){
            puntaje+=0.2
        }
        return puntaje - self.cantidadMayorA500(pizza)*0.1
    }
    method cantidadMayorA500(pizza) = (0.max(pizza.masa()-500)/100).coerceToInteger()
}

object contrera inherits Juez(ingredienteQueNoGusta="quesoAzul") {
    var ingredienteQueLeGusta = "anana"
    var referente = zeff
    method cambiarReferente(nuevoReferente) {
      referente = nuevoReferente
    }
    override method puntuarPizza(pizza) {
        var puntaje = 1
        if(pizza.tieneIngrediente(ingredienteQueLeGusta)){
            puntaje +=0.2
        }
        return puntaje - referente.puntuarPizza(pizza)
    }
}