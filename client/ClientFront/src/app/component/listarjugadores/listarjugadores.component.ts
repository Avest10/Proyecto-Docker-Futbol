import { Component } from '@angular/core';
import { ApiService } from '../../service/api.service';

@Component({
  selector: 'app-listarjugadores',
  templateUrl: './listarjugadores.component.html',
  styleUrl: './listarjugadores.component.css'
})
export class ListarjugadoresComponent {
  jugadores: any[] = [];

  constructor(private api: ApiService){

  }

  ngOnInit(): void {
    this.listarjugadores();
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










}
