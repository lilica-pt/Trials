import * as C from './App.styles';
import { useState } from 'react';
import { Item } from './types/Item';
import { ListItem } from './components/listItem';
import { AddArea } from './AddArea';

const App = () => {
  const [list, setList] = useState<Item[]>([
    { id: 1, name: "comprar pão", done: false },
    { id: 2, name: "comprar bolo", done: true },
  ]);

  const handleAddTask = (taskName: string) => {
    let newList = [...list];
    newList.push({
      id: list.length + 1,
      name: taskName,
      done: false
    });
    setList(newList);
  }

  return (
    <C.Container>
      <C.AreaCentral>
        <C.Header>Lista de Tarefas</C.Header>

        <AddArea onEnter={handleAddTask} />

        {list.map((item, index) => (
          <ListItem key={index} item={item} />
        ))}

      </C.AreaCentral>
    </C.Container>
  );
}

export default App;