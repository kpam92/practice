import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import SearchContainer from './search/search_container';

import NavContainer from './nav/nav_container';


const App = () => (
  <div className='container-fluid no-left'>


      <Route exact path="/" component={ SearchContainer } />
  </div>
);

export default App;
