import { uniqueId } from '../../util/id_gen';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props){
    super(props)
  }

  render() {
    return(
      <div>
        <h1>this is the form everyone</h1>
        <form>
          <label>title: </label>
          <input type="text" placeholder="ex: put on makeup"></input>
          <label>description: </label>
          <input type="text" placeholder="make myself beautiful"></input>
        </form>
      </div>
    )
  }
};

export default TodoForm;
