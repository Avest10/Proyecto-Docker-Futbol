import { Component } from '@angular/core';
import { ApiService } from '../../service/api.service';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-listarjugadores',
  templateUrl: './listarjugadores.component.html',
  styleUrls: ['./listarjugadores.component.css']
})
export class ListarjugadoresComponent {
  rendimiento: any[] = [];
  jugadores: any[] = [];
  mostrarPopupFlag: boolean = false;

  constructor(private api: ApiService, private datePipe: DatePipe) {}

  ngOnInit(): void {
    this.listarjugadores();
  }

  // Función para mostrar el popup
  mostrarPopup(JugadorID: number) {
    this.mostrarPopupFlag = true;

    this.api.getRendimiento(JugadorID).subscribe(
      data => {
        this.rendimiento = this.transformarArrayRendimiento(data);
      },
      error => {
        console.error('Error al obtener la lista de rendimiento.', error);
      }
    );
  }


  // Función para cerrar el popup
  cerrarPopup() {
    this.mostrarPopupFlag = false;
  }

  listarjugadores() {
    this.api.getJugadores().subscribe(
      data => {
        this.jugadores = this.transformarArray(data);
      },
      error => {
        console.error('Error al obtener la lista de jugadores.', error);
      }
    );
  }

  transformarArray(array: any[]): any[] {
    return array.map(jugador => {
      return {
        JugadorID: jugador[0],
        NombreJugador: jugador[1],
        EquipoID: jugador[2]
      };
    });
  }

  transformarArrayRendimiento(array: any[]): any[] {
    return array.map(rendimiento => {
      return {
        FechaRendimiento: this.formatFecha(rendimiento[0]),
        JugadorID: rendimiento[1],
        RendimientoID: rendimiento[2]
      };
    });
  }

  private formatFecha(fecha: any): string {
    if (!fecha) {
      return '';  // O cualquier valor predeterminado que desees si fecha es undefined
    }

    // Formatear la fecha directamente en TypeScript
    const dateObj = new Date(fecha);
    const year = dateObj.getFullYear();
    const month = (dateObj.getMonth() + 1).toString().padStart(2, '0');
    const day = dateObj.getDate().toString().padStart(2, '0');

    return `${year}-${month}-${day}`;
  }
}
