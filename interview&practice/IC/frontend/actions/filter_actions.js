import { fetchLocations } from './location_actions'

// export const UPDATE_FILTER = 'UPDATE_FILTER';
export const UPDATE_BOUNDS = 'UPDATE_BOUNDS';
export const UPDATE_FILTER = 'UPDATE_FILTER';
export const DELETE_FILTER = 'DELETE_FILTER';

export const updateBounds = (bounds) => ({
  type: UPDATE_BOUNDS,
  bounds
});

export const changeFilter = (filter, value) => ({
  type: UPDATE_FILTER,
  filter,
  value
});
export const deleteFilter = (filter) => ({
  type: DELETE_FILTER,
  filter
});

export function updateFilter(filter, value) {
  return (dispatch, getState) => {
    dispatch(changeFilter(filter, value));
    return fetchLocations(getState().filters)(dispatch);
  }
}

export function removeFilter(filter) {
  return (dispatch, getState) => {
    dispatch(deleteFilter(filter));
    return fetchLocations(getState().filters)(dispatch);
  }
}
