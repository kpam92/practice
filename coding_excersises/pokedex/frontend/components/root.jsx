import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import { Router, route, hashHistory } from 'react-router'
const Root = ({ store }) => (
  <Provider store={store}>
    <PokemonIndexContainer/>
  </Provider>
);

export default Root;
