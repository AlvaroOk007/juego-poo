import wollok.game.*
import elementosDelJuego.*

object teclado {
	
	method configuracion(){
		
		keyboard.up().onPressDo{ if( tanke.image() != "./assets/tanke/tanke-arriba.jpg" ) tanke.image( "./assets/tanke/tanke-arriba.jpg" ) else tanke.moverA( tanke.position().up(1) ) }
		keyboard.down().onPressDo{ if( tanke.image() != "./assets/tanke/tanke-abajo.jpg" ) tanke.image( "./assets/tanke/tanke-abajo.jpg" ) else tanke.moverA( tanke.position().down(1) ) }
		keyboard.left().onPressDo{ if( tanke.image() != "./assets/tanke/tanke-izquierda.jpg" ) tanke.image( "./assets/tanke/tanke-izquierda.jpg" ) else tanke.moverA( tanke.position().left(1) ) }
		keyboard.right().onPressDo{  if( tanke.image() != "./assets/tanke/tanke-derecha.jpg" ) tanke.image( "./assets/tanke/tanke-derecha.jpg" ) else tanke.moverA( tanke.position().right(1) ) }
	
		//Lo siguiente es solo para ir mostrando asi poder probrar algunas cosas por pantalla
		keyboard.c().onPressDo{ tanke.image("./assets/tanke/tanke-arriba.jpg") }
		keyboard.e().onPressDo{ game.say( tanke, "La coordenada de aca es " + tanke.position() ) }
		keyboard.space().onPressDo{ tanke.disparar() }	
	}
	
}
