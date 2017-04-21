import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {receiveTodo, removeTodo} from './actions/todo_actions'

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  const root = document.getElementById('content');
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  ReactDOM.render(
    <Root store={store} />, root);
});
