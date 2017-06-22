import merge from 'lodash/merge';

import { RECEIVE_LOCATION_DETAIL } from '../actions/location_detail_actions';
const initialState = {
  'adult' : false,
  'backdrop_path' : "/rQS1bIsXTiZwiwTJ6vI5PHinvK2.jpg",
  'genre_ids' : Array(2),
  'id' : 65050,
  'original_language' : "en",
  'original_title' : "180",
  'overview' : "Ajay (Siddharth) comes to Kasi, where his thoughts and ideas on life and death undergo a sea change after he meets a young boy. He relocates to Chennai and stays in a house owned by a couple S V S Murthy (Mouli) and Jayam (Geetha). They treat him as their own son. A do-gooder, Ajay with his jovial nature wins the heart of all those whom he comes across. Vidya (Nithya Menen), a photo journalist meets Ajay and falls for his good nature. Ajay with the help of Vidya even gets street children obtain sponsorship for their education. But things take a turn when Vidya expresses her love to Ajay. He quietly walks off the place and decides to leave Chennai. But a rude accident to Vidya puts the responsibility on Ajay's shoulders to get her back to health. He takes her to USA for a surgery. Meanwhile a flashback reveals that Ajay was a successful doctor in the United States and who led a happy life.",
  'popularity' : 1.006703,
  'poster_path' : "/2ztXNTrtoe7Q9LcLVbcgSkHizUK.jpg",
  'release_date' : "2011-06-25",
  'title' : "180",
  'video' : false,
  'vote_average' : 4.7,
  'vote_count' : 3
}
const LocationDetailReducer = (state = initialState, action) => {
  Object.freeze(state)
  let newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_LOCATION_DETAIL:
      return action.location;
    default:
      return state;
  }
};

export default LocationDetailReducer;
