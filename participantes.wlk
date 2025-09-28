import jurado.*
import concurso.*

object taylorswift {
    var costoBanda = 1
    
    method actualizarCostoBanda(unCosto) {costoBanda = unCosto}
    method tieneBanda() = true 
   
    method calidad() = 5 + costoBanda
    method ocupaDeEscenario() = (costoBanda * 10).max(concurso.escenario())

    method practicar() {
        costoBanda = costoBanda * 2
    }
}

object morat {

    const integrantesDeLaBanda = []
    method integrantes() = integrantesDeLaBanda
    method tieneBanda() = true 
   
    method calidad() = integrantesDeLaBanda.size() * 2
    method ocupaDeEscenario() {
        return(
            (integrantesDeLaBanda.fold(0, {acum ,i => acum + i.length()})).max(concurso.escenario())
        )
    }
    
    method unirALaBanda(unaPersona) {integrantesDeLaBanda.add(unaPersona)}
    method unirTodosALaBanda(listaDePersonas) {integrantesDeLaBanda.addAll(listaDePersonas)}
    method seVaDeLaBanda(unaPersona) {integrantesDeLaBanda.remove(unaPersona)} //agregado para realizar pruebas

        //entrenamiento
    
    method practicar() {
        self.integranteConMasDe5Caracteres().forEach({i => self.seVaDeLaBanda(i)})
    }
    
    method integranteConMasDe5Caracteres() {
        return integrantesDeLaBanda.filter({i => i.length() > 5})
    }

        
}

object silvioRodriguez {

    method tieneBanda() =  false
    method calidad() = 10
    method ocupaDeEscenario() = 1  

    method practicar() {}
  
}

object badBunny {
    var calidad = 1
    var tieneBanda = false
    var cantMiembrosBanda = 0

    
    const decoracionEscenario = []
    
    method tieneBanda() = tieneBanda 

    method calidad() = calidad + self.calidadDecoracionEscenario()
    method ocupaDeEscenario() = (1 + self.cantidadDeDecoracion() + cantMiembrosBanda).min(20)
    
    method cantMiembrosBanda() = cantMiembrosBanda
    method agregarDecoracionAlEscenario(unObjeto) {
        decoracionEscenario.add(unObjeto)
    }
    //14 
    method adquiereBandaParaElShow(cantidadMiembros) {
        tieneBanda = not(tieneBanda)
        cantMiembrosBanda = cantidadMiembros
        calidad = calidad + 5 + (cantidadMiembros * 2)
    }

    method calidadDecoracionEscenario() {
         return(decoracionEscenario.sum({d => d.calidadDeDecorado()}))
    }

    method cantidadDeDecoracion() = decoracionEscenario.sum({d => d.cantidadQueOcupa()})
    method practicar() {
        calidad = calidad * 2
        cantMiembrosBanda += 3

    }
    
}

//decoraciones posibles
object luces {
    var cantLuces = 0
 
    method añadirLuces(cantidad) {
      cantLuces =+ cantidad
    }
    method cantidadQueOcupa() {
        if (cantLuces >=10){
            return(15)
        } else {
            return(5)
        }
    }
    method calidadDeDecorado(){
        if(self.cantidadQueOcupa().between(10, 15)){
            return(10)
        }else if(self.cantidadQueOcupa().between(1, 9)){
            return(5)
        }else{
            return(0)
        }
    }
    
}

object pantallaGigante {
    method calidadDeDecorado() = 2 
    method cantidadQueOcupa() = 1
}

object fuegosArtificiales {
    method calidadDeDecorado() = 1 
    method cantidadQueOcupa() = 3
}