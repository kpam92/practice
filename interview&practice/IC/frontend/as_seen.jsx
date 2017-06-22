import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import React from 'react';
import { retrieveLocations, saveLocations, fetchLocationInfo } from './util/location_api_util';
import { receiveLocations, fetchLocations} from './actions/location_actions';
import { fetchLocationDetail } from './actions/location_detail_actions';
import { updateFilter, removeFilter } from './actions/filter_actions';
import { addFocus, deleteFocus } from './actions/focus_actions';



document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  window.store = store;
  window.retrieveLocations = retrieveLocations;
  window.fetchLocations = fetchLocations;
  window.fetchLocationDetail = fetchLocationDetail;
  window.fetchLocationInfo = fetchLocationInfo;
  window.receiveLocations = receiveLocations;
  window.saveLocations = saveLocations;
  window.updateFilter = updateFilter;
  window.removeFilter = removeFilter;
  window.addFocus = addFocus;
  window.deleteFocus = deleteFocus;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store }/>, root);
});
