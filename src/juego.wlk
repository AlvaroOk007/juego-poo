import wollok.game.*
import elementosDelJuego.* 
import teclado.*

object juego {
	method iniciar(){
		game.title("Battle city")
		game.width(15)
		game.height(15)
		
		//game.cellSize(100)
		//game.ground("./assets/bala/bala-arriba.jpg")
		//game.addVisualCharacter(tanke)
		game.addVisual(tanke)
		game.addVisual( new Enemigo(position=game.at(5,5)) )
		game.addVisual( new Enemigo(position=game.at(10,10)) )
		game.addVisual( new Enemigo(position=game.at(3,8)) )
		game.addVisual( new Enemigo(position=game.at(9,2)) )
		
		teclado.configuracion()
	
	}
}
