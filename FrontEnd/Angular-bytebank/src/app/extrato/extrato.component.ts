import { TransferenciaService } from './../services/transferencia.service';
import { Component, Input, OnInit } from '@angular/core';
import { Transferencia } from '../models/transferencia.models';

@Component({
  selector: 'app-extrato',
  templateUrl: './extrato.component.html',
  styleUrls: ['./extrato.component.scss']
})
export class ExtratoComponent implements OnInit {

  // Decorator que vai permitir a criação de uma proprety bind trazendo dados para cá - @Input () que foi apagado
  transferencias: any[];

  constructor (private service: TransferenciaService) { // injetando o service

   }

  ngOnInit(): void {

    /* com o Service, invoco o método todas, que retornar um Service
    me inscrevo na resposta desse método, quando retornar com sucesso, recebo como parâmetro a lista de transferências do tipo array de transferência
    imprimo em formato de tabela e atribuo à propriedade transferência
    vai exibir no front e em console e network inspecionado
    */
    this.service.todas().subscribe((transferencias: Transferencia[]) => {
      console.table(transferencias);
      this.transferencias = transferencias;
    });
  }
  }
