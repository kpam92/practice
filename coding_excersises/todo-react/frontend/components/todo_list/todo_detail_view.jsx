import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props){
    super(props);
  }

  render(){
    return(
      <h5 className="detailView">{this.props.body}</h5>
    )
  }
}

export default TodoDetailView;
