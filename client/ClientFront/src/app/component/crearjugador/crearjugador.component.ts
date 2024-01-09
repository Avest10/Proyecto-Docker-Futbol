import { Component } from '@angular/core';
import { ApiService } from '../../service/api.service';

@Component({
  selector: 'app-crearjugador',
  templateUrl: './crearjugador.component.html',
  styleUrl: './crearjugador.component.css'
})
export class CrearjugadorComponent {

  Jugador: any = {}; // Puedes usar un formulario para recopilar estos datos
 
  constructor(private api: ApiService) {}
 
  nuevoJugador() {
    this.api.anadirJugador(this.Jugador).subscribe(
      response => {
        console.log('Jugador añadido con éxito.', response);
        // Puedes realizar otras acciones después de la creación exitosa
        window.location.reload();
      },
      error => {
        console.error('Error al añadir el jugador.', error);
        
      }
    );
  }
  
}
