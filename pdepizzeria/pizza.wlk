class Pizza {
    const masaInicial
    var masa = masaInicial
    const ingredientes

    var gradoDeCoccion

    method cocinarPor(minutos) {
      gradoDeCoccion += minutos * (10/masa)
      masa -=  (masaInicial*0.001)
    }
    method agregarIngrediente(ingrediente) {
      ingredientes.add(ingrediente)
    }

    method estaCruda() = gradoDeCoccion<0.4
    method estaQumada() = gradoDeCoccion>1
    method noEstaCrudaNiQuemada() = (!self.estaCruda() and !self.estaQumada())

    method tieneIngrediente(ingredienteBuscado) = ingredientes.contains(ingredienteBuscado)
    method estaCargada() = ingredientes != ingredientes.withoutDuplicates()

    method masa() = masa
    method masaInicial() = masaInicial 
}