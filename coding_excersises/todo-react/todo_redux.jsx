import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import configureStore from './frontend/store/store'
import { receiveTodo, receiveTodos, removeTodo } from './frontend/actions/todo_actions'
import { allTodos } from './frontend/reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
	const store = configureStore;
	window.store = store;
	window.receiveTodo = receiveTodo;
	window.receiveTodos = receiveTodos;
	window.removeTodo = removeTodo;
	window.allTodos = allTodos
	// window.todos = window.allTodos(store.getState())


	const root = document.getElementById("root");
	ReactDOM.render(<Root store={store}/>, root);
});
