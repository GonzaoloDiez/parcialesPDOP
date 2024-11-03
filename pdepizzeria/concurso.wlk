import pdepizzeria.jueces.*
import pdepizzeria.pizzeros.*

class Concurso {
    const pizzerosConcursantes = new List()
    const jurado = new List()

    method iniciarConcurso() {
        //preparan la pizza
        pizzerosConcursantes.forEach({pizzero => pizzero.cocinarPizza()})
        //ronda de vetos
        const pizzerosPasables = self.rondaVetos() 
        //evaluan las pizzas
        const puntajesPizzas = self.puntuarPizzas(pizzerosPasables)
        //a ver si hay empate
        self.hayEmpate(puntajesPizzas)
        //seleccionan al pizzero ganador
        return self.encontrarGanador(pizzerosPasables,puntajesPizzas)
    }

    method hayEmpate(puntajes) {
      //si llegase a haber empate no hay ganador posible
      //si el ultimo y el anteultimo son iguales
      if (puntajes.get(puntajes.size()-2)==puntajes.last()){ 
            self.error("No hay ganador posible")
      }
    }

    method rondaVetos() {
      //dejo a los pizzeros no vetadas
      const pizzerosNoVetados = pizzerosConcursantes.filter({pizzero => jurado.all({juez => !juez.pizzaVetable(pizzero.pizza())})})
      //si todos los pizzeros fueron vetados, no hay ganador posible
      if(pizzerosNoVetados.isEmpty()){
        self.error("No hay ganador posible")
      }
      return pizzerosNoVetados
    }

    method puntuarPizzas(pizzerosPasables) {
        //consigo las pizzas
        const pizzas = pizzerosPasables.map({pizzero=>pizzero.pizza()})
        //consigo los puntaje de cada pizza
        const puntajesXPizza = pizzas.map({pizza=>jurado.map({juez=>juez.juzgarPizza(pizza)})})//sum no funcionaba
      //sumo los puntajes de cada pizza, 
      const puntajesPizza = puntajesXPizza.map({puntajes=>puntajes.sum()})
      //lo ordeno MenMay para luego evaluar empate
      return puntajesPizza.sortedBy{n1,n2=>n1<n2}
    }

    method encontrarGanador(pizzerosPasables,puntajes) {
      //buscar en los pizzeros el pizzero con la piza  
      //que tiene el puntaje igual al mas alto
      return pizzerosPasables.filter({pizzero=>jurado.map({juez=>juez.juzgarPizza(pizzero.pizza())}).sum()==puntajes.max()}).anyOne()//no funcionaba take o get
    }
}