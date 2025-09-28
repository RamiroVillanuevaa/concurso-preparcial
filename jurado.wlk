 import participantes.*
 import concurso.*
 
 
 object mozart {
    var puntos = 0
    method puntos() = puntos
    method puntaje(participante) { puntos = (participante.calidad()*2).min(10) }
    method recibirAjuste() {
        puntos = puntos.min(8)
    }
 }

 object beethoven {
    method puntos(participante) = participante.ocupaDeEscenario() / 10 
    var animo = 1
    var estaEntusiasmado = animo.between(2, 5)
    method animo() = animo
    method estaEntusiasmado() = estaEntusiasmado
    method cambiarEstadoAnimico(unNumero) {animo = unNumero.min(5)}
    method estaEnojado() {return(animo == 1)}

    method recibirBuenasNoticias(){
        estaEntusiasmado = not(estaEntusiasmado)
        animo = 5
    } 
    method recibirAjuste() {
        if(self.estaEntusiasmado()){
            animo -= 1
        }
    }
 }