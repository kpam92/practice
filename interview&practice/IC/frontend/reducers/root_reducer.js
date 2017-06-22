import { combineReducers } from 'redux';
import LocationsReducer from './locations_reducer';
import FilterReducer from './filter_reducer';
import LocationDetailReducer from './location_detail_reducer';
import FocusReducer from './focus_reducer';

const rootReducer = combineReducers({
  locations: LocationsReducer,
  filters: FilterReducer,
  detail: LocationDetailReducer,
  focus: FocusReducer
});

export default rootReducer;
