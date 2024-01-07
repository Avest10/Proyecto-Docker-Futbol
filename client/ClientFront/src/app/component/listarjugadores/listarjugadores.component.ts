import { Component } from '@angular/core';
import { ApiService } from '../../service/api.service';

@Component({
  selector: 'app-listarjugadores',
  templateUrl: './listarjugadores.component.html',
  styleUrl: './listarjugadores.component.css'
})
export class ListarjugadoresComponent {
  rendimiento: any[] = [];
  jugadores: any[] = [];
  mostrarPopupFlag: boolean = false

  constructor(private api: ApiService){

  }

  ngOnInit(): void {
    this.listarjugadores();
  }

  // Función para mostrar el popup
  mostrarPopup(JugadorID: number) {
    this.mostrarPopupFlag = true;

    this.api.getRendimiento(JugadorID).subscribe(
      data => {
        this.jugadores = this.transformarArrayRendiemiento(data)
      },
      error => {
        console.error('Error al obtener la lista de jugadores.', error);
      }
    )   

  }
 
  // Función para cerrar el popup
  cerrarPopup() {
    this.mostrarPopupFlag = false;
  }

  listarjugadores(){
    this.api.getJugadores().subscribe(
      data => {
        this.jugadores = this.transformarArray(data)
      },
      error => {
        console.error('Error al obtener la lista de jugadores.', error);
      }
    )
  }

  transformarArray(Array: any[]): any[] {
    return Array.map(jugador => {
      return {
        JugadorID: jugador[0],
        NombreJugador: jugador[1],
        EquipoID: jugador[2]
      };
    });
  }



  transformarArrayRendiemiento(Array: any[]): any[] {
    return Array.map(rendimiento => {
      return {
        HistoricoID: rendimiento[0],
        FechaRendimiento: rendimiento[1],
        JugadorID: rendimiento[2],
        RendimientoID: rendimiento[3]
      };
    });
  }







}
