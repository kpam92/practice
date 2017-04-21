import merge from 'lodash/merge';

const errorReducer = (state = [], action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case RECEIVE_ERRORS:
      nextState = {};
      action.todos.forEach(todo => nextState[todo.id] = todo);
      return nextState;
    case CLEAR ERRORS:
      const newTodo = {[action.todo.id]: action.todo};
      return merge({}, state, newTodo);
    default:
      return state;
  }
};

export default errorReducer;
