import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { Transferencia } from '../models/transferencia.models';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root' // existente enquanto a app estiver ativo
})

export class TransferenciaService {

  private listaTransferencia: any [];
  private url = 'http://localhost:3000/transferencias';

// injetando classe com métodos para requisições de uma API REST, importada manualmente, importar em app.module.ts
constructor(private httpClient: HttpClient) {
  this.listaTransferencia =[];
 }

 get transferencias () {
   return this.listaTransferencia;
 }

 // obter lista de transferências
 todas (): Observable <Transferencia[]> {
   return this.httpClient.get<Transferencia[]>(this.url);
 }

 adicionar (transferencia: Transferencia) : Observable <Transferencia> {
  this.hidratar (transferencia);
  return this.httpClient.post<Transferencia>(this.url, transferencia)
}

private hidratar(transferencia: any) {
  transferencia.data = new Date();
}

 }
