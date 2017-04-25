import React from 'react';
import ReactDOM from 'react-dom';
// import {fetchAllPokemon} from './util/api_util'
// import {receiveAllPokemon} from './actions/pokemon_actions'
// import configureStore from './store/store';
// import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');

  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
