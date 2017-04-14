import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import configureStore from './frontend/store/store'
import { receiveTodo, receiveTodos } from './frontend/actions/todo_actions'
import allTodos from './frontend/reducers/selectors'


document.addEventListener("DOMContentLoaded", () => {
	const store = configureStore;
	window.store = store;
	window.allTodos = allTodos;
	window.receiveTodo = receiveTodo;
	window.receiveTodos = receiveTodos;


	const root = document.getElementById("root");
	ReactDOM.render(<Root store={store}/>, root);
});
