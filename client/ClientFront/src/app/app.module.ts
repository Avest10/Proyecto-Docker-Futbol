import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { DatePipe } from '@angular/common';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { ListarjugadoresComponent } from './component/listarjugadores/listarjugadores.component';
import { VerjugadorComponent } from './component/verjugador/verjugador.component';
import { CrearjugadorComponent } from './component/crearjugador/crearjugador.component';

@NgModule({
  declarations: [
    AppComponent,
    ListarjugadoresComponent,
    VerjugadorComponent,
    CrearjugadorComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    DatePipe,
    provideClientHydration()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
