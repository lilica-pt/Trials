/**
 * @author LiliCa
 * @email lilicabral@sapo.pt
 * @create date 2022-05-24
 * @modify date 2022-05-24
 * @desc [description]
 */
import React from "react";
import { StyleSheet, Dimensions, View, ScrollView } from 'react-native';
import Detalhes from "./components/Detalhes";
import Itens from "./components/Itens";
import Topo from "./components/Topo";

const width = Dimensions.get('screen').width;

export default function Cesta({ topo, detalhes, itens}) {

    return <ScrollView>
        <Topo {...topo} />
        <View style={estilos.cesta}>
            <Detalhes {...detalhes} />
            <Itens {...itens}/>
        </View>
    </ScrollView>
}

const estilos = StyleSheet.create({
    cesta: {
        paddingVertical: 8,
        paddingHorizontal: 16,
    }
});