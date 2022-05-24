import { TransferenciaService } from './services/transferencia.service';
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

// Recebe o evento e propaga para o Service, não mais o trata
export class AppComponent {
  title = 'bytebank';

  // Injetando uma instâcia válida do tipo Service
  constructor (private service: TransferenciaService){

  }
 }
