import { uniqueId } from '../../util/id_gen';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = { title: "", body: "", done: false };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId});
    this.props.receiveTodo;
    this.setState({title: "", body: ""});
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  render() {
    return(
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>title: </label>
          <input type="text" placeholder="ex: put on makeup" onChange={this.update('title')} value={this.state.title}/>
          <label>description: </label>
          <input type="text" placeholder="make myself beautiful" onChange={this.update('body')} value={this.state.body}/>
          <button>submit</button>
        </form>
      </div>
    )
  }
};

export default TodoForm;
