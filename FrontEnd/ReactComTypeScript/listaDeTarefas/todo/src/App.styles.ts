import styled from "styled-components";

// área toda do navegador
export const Container = styled.div`
    background-color: #17181f;
    color: #797a81;
    min-height: 100vh; 
`;

export const AreaCentral = styled.div `
    margin: auto;
    max-width: 980px;
    padding: 10px;
`;

// 0 para zerar propriedades padrão
export const Header = styled.h1 `
    margin: 0;
    padding: 0;
    color: #fff;
    text-align: center;
    border-bottom: 1px solid #444;
    padding-bottom: 20px;
`;
