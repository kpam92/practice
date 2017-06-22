import React from 'react';

import FilterForm from '../search/filter_form'

class Nav extends React.Component {
  constructor(props){
    super(props)
  }

  render(){
    const { updateFilter, removeFilter } = this.props
    return(




      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <div className="navbar-header">
            <h1>As Seen in SF</h1>
          </div>
            <FilterForm
              updateFilter={updateFilter}
              removeFilter={removeFilter}
            />
        </div>
      </nav>
    )
  }
}


export default Nav;
