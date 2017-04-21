import merge from 'lodash/merge';

const errorReducer = (state = [], action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case RECEIVE_ERRORS:
      nextState = action.errors;
      return nextState;
    case CLEAR ERRORS:
      nextState = []
      return nextState;
    default:
      return state;
  }
};

export default errorReducer;
