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
    const detailView = <TodoDetailViewContainer body={this.props.todo.body}/>
    return(

      <li key={this.props.keys}>
        <h1 onClick={toggleDetail}>
          {this.props.todo.title}
        </h1>
        <button onClick={this.changeStatus}>Change Status</button>
        {detailView}

      </li>
    )
  }
}

export default TodoListItem;
