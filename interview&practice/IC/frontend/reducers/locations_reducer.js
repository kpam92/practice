import merge from 'lodash/merge';

import { RECEIVE_LOCATIONS } from '../actions/location_actions';

const LocationsReducer = (state = {}, action) => {
  Object.freeze(state)
  let newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_LOCATIONS:
      return action.locations;
    default:
      return state;
  }
};

export default LocationsReducer;
