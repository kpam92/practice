import React from 'react';
import ReactDOM from 'react-dom';
import {fetchAllPokemon} from './util/api_util'
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors'
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.store = store;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
