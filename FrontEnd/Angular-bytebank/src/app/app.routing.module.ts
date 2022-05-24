import { ExtratoComponent } from './extrato/extrato.component';
import { NgModule } from "@angular/core";
import { RouterModule } from '@angular/router';

// método Root precisa de um array
import { Routes } from '@angular/router';
import { NovaTransferenciaComponent } from './nova-transferencia/nova-transferencia.component';

// objeto e array de rotas
export const routes: Routes = [

  // caso acesse um caminho vazio, será redirecionado
  {path: '', redirectTo: 'extrato', pathMatch: 'full'},

  // cada objeto é uma rota. O caminho x corresponde ao componente x
  { path: 'extrato', component: ExtratoComponent},
  { path: 'nova-transferencia', component: NovaTransferenciaComponent},
];

@NgModule ({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule], // para que tenha acesso às configurações
})

export class AppRoutingModule {

}
