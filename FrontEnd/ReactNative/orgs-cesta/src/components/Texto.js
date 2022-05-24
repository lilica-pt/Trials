/**
 * @author LiliCa
 * @email lilicabral@sapo.pt
 * @create date 2022-05-24
 * @modify date 2022-05-24
 * @desc [description]
 */
import React from "react";
import { Text, StyleSheet } from "react-native";

export default function Texto({ children, style }) {
    let estilo = estilos.texto;

    if (style?.fontWeight === 'bold') {
        estilo = estilos.textoNegrito;
    }

    return <Text style={[style, estilo]}>{children}</Text>
}

const estilos = StyleSheet.create({
    texto: {
        fontFamily: "MontsserratRegular",
        fontWeight: "normal",
    },
    textoNegrito: {
        fontFamily: "MontserratBold",
        fontWeight: "normal",
    }
})