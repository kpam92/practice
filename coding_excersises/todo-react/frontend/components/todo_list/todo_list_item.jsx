import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container'

class TodoListItem extends React.Component {
  constructor(props){
    super(props)
    this.changeStatus = this.changeStatus.bind(this);
  };

  changeStatus() {
    const changedStatus = this.props.todo.done === true? false : true;
    this.props.todo.done = changedStatus;
  }

  render(){


    const { todo, removeTodo } = this.props;

    return(

      <li key={this.props.keys}>{this.props.todo.title}<button onClick={this.changeStatus}>Change Status</button></li>
    )
  }
}

export default TodoListItem;
