import React from 'react';
import Clock from './clock'
import Weather from './weather'

class Root extends React.Component {

  render() {
    return(

      <div>
        <Clock/>
        <Weather/>
      </div>
    )
  }

}

export default Root
