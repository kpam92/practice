import * as TodoAPIUtil from '../utils/todo_api_util'
import { receiveErrors, clearErrors } from './error_actions';


export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const updateTodo = todo => dispatch => (
  TodoAPIUtil.updateTodo(todo).then(todo => dispatch(receiveTodo(todo)))
);

export const deleteTodo = todo => dispatch => (
  TodoAPIUtil.updateTodo(todo).then(todo => dispatch(removeTodo(todo)))
);

export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = todo => dispatch => (
  TodoAPIUtil.createTodo(todo)
  .then(todo => { dispatch(receiveTodo(todo)); dispatch(clearErrors())},
  err => dispatch(receiveErrors(err.responseJSON)))
);

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});
