import React from 'react';

class AutoComplete extends React.Component {
  constructor(props){
    super(props)
    this.state = { inputVal : ""}
  }

  render(){
    return(
      <div>
      <h1>AUTOCOMPLETE</h1>
      <ul>
        {
          this.props.names.map((name,idx)=> <li key={idx}>{name}</li> )
        }
      </ul>
    </div>
    )
  }
}

export default AutoComplete;
