import React from 'react';
import ReactDOM from 'react-dom';
import App from './frontend/components/app';
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
	ReactDOM.render(<App/>, root);
});
