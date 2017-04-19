import React from 'react';

class TodoListItem extends React.Component {
  constructor(props){
    super(props)
  };

  render(){
    return(
      <li key={this.props.keys}>{this.props.todo.title}<button>DELETE</button></li>
    )
  }
}

export default TodoListItem;
