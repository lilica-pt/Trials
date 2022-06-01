import styled from 'styled-components';

type ContainerProps = {
    done: boolean;
}

/* transformou a div em uma função para utilizar o props nela */
export const Container = styled.div(({ done }: ContainerProps) => (
    `
    display: flex;
    background-color: #20212x;
    padding: 10px;
    margin-bottom: 10px;
    align-items: center;

    input {
        width: 25px;
        height: 25px;
        margin-right: 25px;
    }

    label {
        color: #ccc;
        text-decoration: ${done ? 'line-through' : 'initial'};
    }`
    /* quando o done for true, ele vai riscar, quando não, mantém a forma inicial */
));