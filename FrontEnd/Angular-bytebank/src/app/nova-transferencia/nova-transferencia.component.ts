import { Component, EventEmitter, Output } from '@angular/core';
import { RouterModule } from '@angular/router';
import { Transferencia } from '../models/transferencia.models';
import { TransferenciaService } from './../services/transferencia.service';

@Component({
  selector: 'app-nova-transferencia', // angular.json diz que todos os componentes precisam ter o prefixo app-
  templateUrl: './nova-transferencia.component.html',
  styleUrls: ['./nova-transferencia.component.scss'],
})

export class NovaTransferenciaComponent {

  // Metadata para propagar uma informação através de um evento (ao)
  @Output() aoTransferir = new EventEmitter<any>(); // propagar o dado deste objeto do tipo any, ou seja, tipo híbrido

  // Atributo
  valor: number;
  destino: number;

  // passando objeto para o service
  constructor (private service: TransferenciaService, private router: RouterModule) {

  }

  // Método ao clicar no botão de .html chamado em form
  transferir() {
    console.log('Nova transferência solicitada');

    // console.log('Valor: ', this.valor); alt + shift + (seta para baixo para duplicar)
    // console.log('Destino: ', this.destino); o this. blinda os atributos desta classe, para receber o valor
    const valorEmitir : Transferencia = {valor:this.valor, destino: this.destino};

    this.service.adicionar(valorEmitir).subscribe(resultado => {
      console.log('Solicitada nova transferência');
      const valorEmitir = { valor: this.valor, destino: this.destino };
      this.aoTransferir.emit(valorEmitir);

      this.limparCampos();
    },
    (error) => console.error(error)
    );
  }

  limparCampos() {
    this.valor = 0;
    this.destino = 0;
  }
}
