import logo from "./../../assets/logo.png";
import tomate from "../../assets/frutas/Tomate.png";
import brocolis from "../../assets/frutas/Brócolis.png";
import batata from "../../assets/frutas/Batata.png";
import pepino from "../../assets/frutas/Pepino.png";

const cesta = {
    topo: {
        titulo: "Detalhes da cesta",
    },
    detalhes: {
        nomeCesta: "Cesta de Verduras",
        logoFazenda: logo,
        nomeFazenda: "Cria Local",
        descricao: "Uma cesta de produtos selecionados cuidadosamente de produtores locais direto para a sua cozinha!",
        preco: "R$ 40,00",
        botao: "Comprar",
    },
    itens: {
        titulo: "Itens da cesta",
        lista: [
            {
                nome: "Tomate",
                imagem: tomate,
            }, 
            {
                nome: "Brócolis",
                imagem: brocolis,
            }, 
            {
                nome: "Batata",
                imagem: batata,
            }, 
            {
                nome: "Pepino",
                imagem: pepino,
            }, 
        ]
    }
}

export default cesta;