import actividades.*

class Socios{
	const actividades = []
	const maximo
	var property edad
	var property idiomas = []
	
	method agregarActividad(actividad){
		if(actividades.size() < maximo){
			actividades.add(actividad)
		} else {
			throw new Exception(message = "Alcanzó el maximo de actividades")
		}
		
	}
	
	method adoraElSol() = actividades.all({x => x.sirveParaBroncearse()})
	
	method actividadesEsforzadas() = actividades.filter({ x => x.implicaEsfuerzo()})
	
	method leAtraeActividad(actividad)
}


class SocioTranquilo inherits Socios{
	
	override method leAtraeActividad(actividad) = actividad.dias() >= 4

}


class SocioCoherente inherits Socios{
	
	override method leAtraeActividad(actividad) = 
		if (self.adoraElSol()) actividad.sirveParaBroncearse()
		else actividad.implicaEsfuerzo()
		
}


class SocioRelajado inherits Socios{
	
	override method leAtraeActividad(actividad) =
		idiomas.any({ idioma => actividad.idiomas().contains(idioma)})
		
}