import React from 'react';
import Clock from './clock'
import Weather from './weather'
import AutoComplete from './autocomplete'


const Names = [
  'Nina',
  'Jaymes',
  'Kimora',
  'Cynthia',
  'Charlie',
  'Valentina',
  'Trinity',
  'Eureka',
  'Alexis',
  'Sasha',
  'Aja',
  'Shea',
  'Peppermint',
  'Farrah'
]
class Root extends React.Component {

  render() {
    return(

      <div>
        <Clock/>
        <Weather/>
        <AutoComplete names={Names}/>
      </div>
    )
  }

}

export default Root
