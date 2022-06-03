import * as C from './styles';
import { Item } from '../../types/Item';
import { TableItem } from '../TableItem';

type Props = {
    list: Item[]
}

export const TableArea = ({ list }: Props) => {
    return (
        <C.Table>
            <thead>
                <tr>
                    <C.TableHeadComumn width={100}>Data</C.TableHeadComumn>
                    <C.TableHeadComumn width={130}>Categoria</C.TableHeadComumn>
                    <C.TableHeadComumn>Título</C.TableHeadComumn>
                    <C.TableHeadComumn width={150}>Valor</C.TableHeadComumn>
                </tr>
            </thead>
            <tbody>
                {list.map((item, index) => (
                    <TableItem key={index} item={item} />
                ))}
            </tbody>
        </C.Table>
    );
}