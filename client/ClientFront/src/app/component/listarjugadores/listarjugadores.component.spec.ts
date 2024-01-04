import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarjugadoresComponent } from './listarjugadores.component';

describe('ListarjugadoresComponent', () => {
  let component: ListarjugadoresComponent;
  let fixture: ComponentFixture<ListarjugadoresComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ListarjugadoresComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ListarjugadoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
