import React from 'react';
import Clock from './clock'
import Weather from './weather'
import AutoComplete from './autocomplete'

class Root extends React.Component {

  render() {
    return(

      <div>
        <Clock/>
        <Weather/>
        <AutoComplete/>
      </div>
    )
  }

}

export default Root
