import React from 'react';

class TodoList extends React.Component {
  constructor(props) {
    super(props)
  };

  render(){
    const { todos, receiveTodo } = this.props;
    const todoItems = todos.map(todo => (
        <h1>{todo.title}</h1>
      )
    );
    return(
      todoItems
    )
  };
}


export default TodoList;
