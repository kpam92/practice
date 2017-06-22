import * as APIUtil from '../util/location_api_util'

export const RECEIVE_LOCATIONS = 'RECEIVE_LOCATIONS';

export const receiveLocations = locations => ({
  type: RECEIVE_LOCATIONS,
  locations
});

export const retrieveAPILocations = () => dispatch => (
  APIUtil.retrieveAPILocations().then(locations => (
    dispatch(saveLocations(locations))
  ))
);

export const saveLocations = (locations) => dispatch => (
  APIUtil.saveLocations(locations)
    .then(locations => dispatch(receiveLocations(locations)))
);


export const fetchLocations = (filters) => dispatch => (
  APIUtil.fetchLocations(filters).then(locations => (
    dispatch(receiveLocations(locations))
  ))
);
