import wollok.game.*

class Bala {
	
	var property image = self.direccionDeBala()
	var property position
	var property direccion
	
	method direccionDeBala(){
		return if( self.direccion() == arriba ) "./assets/bala/bala-arriba.jpg" 
		else if ( self.direccion() == abajo ) "./assets/bala/bala-abajo.jpg" 
		else if( self.direccion() == izquierda ) "./assets/bala/bala-izquierda.jpg" 
		else "./assets/bala/bala-derecha.jpg"
	}
	
	method danio(){
		return 10
	}
}

class Enemigo {
	var property image = "./assets/enemigo.png"
	var property position
	var vida = 100
	
	method recibirDanioDe(unElemento){
		vida = vida - unElemento.danio()
		if( vida == 0 ) {
			self.image("./assets/explota.png")
			//game.onTick()
			game.removeVisual(self)
		}
	}
	
}

object tanke {

	var property image = "./assets/tanke/tanke-arriba.jpg"
	var property position = game.at(1,1)
	
	method moverA(unaPosicion){
		position = unaPosicion
	}
	
	//method direccion(objeto){
	//	return if( self.image() == "./assets/tanke-arriba.jpg" ) objeto.position().up(1) else if ( self.image() == "./assets/tanke-abajo.jpg" ) objeto.position().down(1) else if( self.image() == "./assets/tanke-izquierda.jpg" ) objeto.position().left(1) else objeto.position().right(1)
	//}
	
	method direccion(){
		//Indica la direccion actual del tanke
		
		return if( self.image() == "./assets/tanke/tanke-arriba.jpg" ) arriba 
		else if ( self.image() == "./assets/tanke/tanke-abajo.jpg" ) abajo 
		else if( self.image() == "./assets/tanke/tanke-izquierda.jpg" ) izquierda 
		else derecha
		
	}
	
	method disparar(){
		// Vamos a hacer que primero dispare para arriba
		var unaBala = new Bala(position= self.direccion().mover(self.position()), direccion=self.direccion() )
		game.addVisual(unaBala)
		game.onCollideDo( unaBala, { enemigo => enemigo.image("./assets/explota.png") } )
		
		game.onTick( 100, "balaMovimiento", { => 
			unaBala.position( unaBala.direccion().mover(unaBala.position()) ) 
		} 
		// Es necesario eliminar el onTick y la bala una vez salida del mapa
		// para optimizar el codigo. Està hecho asi, pero da algun error
		
		//game.onTick( 100, "balaMovimiento", { => 
		//	unaBala.position( unaBala.direccion().mover(unaBala.position()) )
		//	if( not unaBala.position().x().between(1 , 13) ){
		//		game.removeTickEvent("balaMovimiento")
		//		game.removeVisual(unaBala)
		//	}
 
		//} 
		
		
		)
		
	}
}

// objeto direccion

object arriba{
	method mover(posicion){
		return posicion.up(1)
	}
}

object abajo{
	method mover(posicion){
		return posicion.down(1)
	}
}
object izquierda{
	method mover(posicion){
		return posicion.left(1)
	}
}
object derecha{
	method mover(posicion){
		return posicion.right(1)
	}
}
