import React from 'react';

class TodoListItem extends React.Component {
  constructor(props){
    super(props)
  };

  render(){


    const { todo, removeTodo } = this.props;

    return(

      <li key={this.props.keys}>{this.props.todo.title}<button onClick={() => removeTodo(todo)}>DELETE</button></li>
    )
  }
}

export default TodoListItem;
