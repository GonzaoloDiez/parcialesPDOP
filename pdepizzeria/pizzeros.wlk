import pdepizzeria.pizza.*

class Pizzero {
    var pizza = self.hacerPrePizza()
    method hacerPrePizza() =new Pizza( masaInicial = 500,ingredientes = ["tomate"],gradoDeCoccion = 0.3)
    
    method cocinarPizza() {
        self.hacerPrePizza()    
        pizza.agregarIngrediente("muzzarella")
        pizza.cocinarPor(10)
    }
    method pizza() = pizza 
}

object carla inherits Pizzero {
     override method cocinarPizza() {
       super()
       pizza.agregarIngrediente("provolone")
       pizza.cocinarPor(1)
     }
}

object facu inherits Pizzero {
    var humor = "arriesgado"//podria ser un bool pero el parcial lo pide asi

    override method cocinarPizza() {
       super()
       self.agregarPorHumor()
    }

    method agregarPorHumor() {
      if (humor == "arriesgado"){
        pizza.agregarIngrediente("anana")
      }
      else if(humor == "conservador"){
        pizza.agregarIngrediente("oregano")
      }
    }

    method cambiarHumorArriesgado() {
      humor="arriesgado"
    }
    method cambiarHumorConservador() {
      humor="conservador"
    }
}

class PizzeroMaritimo inherits Pizzero {
    var ingredienteFavorito
    override method hacerPrePizza() =  new Pizza( masaInicial = 650,ingredientes = ["tomate"],gradoDeCoccion = 0.3)

     override method cocinarPizza() {
       super()
       pizza.agregarIngrediente(ingredienteFavorito)
       pizza.agregarIngrediente(pizzeriaMaritima.ingredienteDelDia())

     }
}

object pizzeriaMaritima{
    var property ingredienteDelDia = "jamon"
}
