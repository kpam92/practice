import React from 'react';

class FilterForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      selected: 'title',
      input: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleRadioChange = this.handleRadioChange.bind(this);
  }

  handleChange(e) {

    this.props.updateFilter(this.state.selected,e.currentTarget.value)
    this.setState({ input: e.target.value})
  }
  handleRadioChange(event) {
    this.props.removeFilter(this.state.selected)
    // debugger;
    this.setState({ selected: event.target.value });
    // debugger;
    this.props.updateFilter(event.target.value, this.state.input)
    // console.log(this.state)

  }

  render(){

    return(
      <ul className="nav navbar-nav navbar-right">
        <li>
          <form className ='input-text'>
          <label>Search: </label>
            <input
              type="text"
              value={this.state[this.state.selected]}
              onChange={this.handleChange}
              ref={(input) => this.input = input}
            />
          </form>
        </li>
        <li>
          <div className="radio">
            <label>
              <input type="radio" value="title" checked={this.state.selected == 'title'} onChange={this.handleRadioChange}/>
              Title
            </label>
          </div>
        </li>
        <li>
          <div className="radio">
            <label>
              <input type="radio" value="person" checked= {this.state.selected == 'person'}  onChange={this.handleRadioChange}/>
              Person
            </label>
          </div>
        </li>
      </ul>
    )
  }
}

export default FilterForm;
