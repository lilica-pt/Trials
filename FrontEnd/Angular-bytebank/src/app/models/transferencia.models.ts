// adiciona integração API rest
export interface Transferencia {
  id?: string; // opcionais
  valor: number;
  destino: number | string;
  data?: Date; // opcionais
}
