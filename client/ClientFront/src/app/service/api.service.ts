import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = 'http://localhost:8000';

  constructor(private http:HttpClient) { }

  getJugadores(): Observable<any[]> {
    return this.http.get<any[]>(this.baseUrl+'/jugadores');
  }

  getJugador(JugadorID: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/jugadores/${JugadorID}`);
  }

  anadirJugador(Jugador: any): Observable<any> {
    return this.http.post(this.baseUrl+'/jugadores', Jugador);
  }

  quitarJugador(JugadorID: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/jugadores/${JugadorID}`);
  }
  getRendimiento(JugadorID: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/jugador/${JugadorID}`);
  }
}
