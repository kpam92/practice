import React from 'react';
import { allTodos } from '../../reducers/selectors'

class TodoList extends React.Component {
  constructor(props) {
    super(props)
  };

  render(){
    const { todos, receiveTodo } = this.props;

    return(
      {this.todos.map((todo,idx) => <h1>{todo.title}</h1>)}
      )

  };
}


export default TodoList;
