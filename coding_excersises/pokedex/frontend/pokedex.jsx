import React from 'react';
import ReactDOM from 'react-dom';
import {fetchAllPokemon} from './util/api_util'
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import configureStore from './store/store';
// import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.store = store;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
