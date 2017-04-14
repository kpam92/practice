import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/root';
import configureStore from './frontend/store/store'
import { receiveTodo, receiveTodos } from './frontend/actions/todo_actions'


document.addEventListener("DOMContentLoaded", () => {
	const store = configureStore;
	window.store = store;
	
	const root = document.getElementById("root");
	ReactDOM.render(<Root/>, root);
});
