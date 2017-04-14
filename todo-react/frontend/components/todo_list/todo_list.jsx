import React from 'react';
import { allTodos } from '../../reducers/selectors'

class TodoList extends React.Component {
  constructor(props) {
    super(props)
  };

  render(){
    const { todos, receiveTodo } = this.props;

    return(
      <h1>{this.props.todos[0].title}</h1>
    )
  };
}


export default TodoList;
