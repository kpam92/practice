import merge from 'lodash/merge';

import { UPDATE_BOUNDS, UPDATE_FILTER, DELETE_FILTER } from '../actions/filter_actions';

const defaultFilters = Object.freeze({
  bounds: {}
});

const FiltersReducer = (state = defaultFilters, action) => {
  Object.freeze(state)
  if (action.type === UPDATE_BOUNDS) {
    const newFilter = {
      ['bounds']: action.value
    };
    return merge({}, state, newFilter);
  } else if (action.type === UPDATE_FILTER) {
    const newFilter = {
      [action.filter]: action.value
    };
    return merge({}, state, newFilter);
  } else if (action.type === DELETE_FILTER) {
    const newState = merge({},state)
    delete newState[action.filter]
    return newState
  } else {
    return state;
  }
};

export default FiltersReducer;
