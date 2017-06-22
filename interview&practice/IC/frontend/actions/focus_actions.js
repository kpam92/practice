// export const UPDATE_FILTER = 'UPDATE_FILTER';
export const ADD_FOCUS = 'ADD_FOCUS';
export const DELETE_FOCUS = 'DELETE_FOCUS';

export const addFocus = (focus) => ({
  type: ADD_FOCUS,
  focus
});

export const deleteFocus = () => ({
  type: DELETE_FOCUS
});

// export function updateFilter(filter, value) {
//   return (dispatch, getState) => {
//     dispatch(changeFilter(filter, value));
//     return fetchLocations(getState().filters)(dispatch);
//   }
// }
//
// export function removeFilter(filter) {
//   return (dispatch, getState) => {
//     dispatch(deleteFilter(filter));
//     return fetchLocations(getState().filters)(dispatch);
//   }
// }
