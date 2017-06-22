
export const retrieveAPILocations = () => {
  return $.ajax({
    method: 'GET' ,
    url: 'https://data.sfgov.org/resource/wwmu-gmzc.json',
    error: (err) => console.log(err)
  })
}

export const saveLocations = (locations) => {
  return $.ajax({
    method: 'POST' ,
    url: 'api/locations',
    error: (err) => console.log(err),
    data: { locations: locations }
  })
}

export const fetchLocations = (data) => {
  return $.ajax({
    method: 'GET' ,
    url: 'api/locations',
    data
  })
}


//location detail fetch action

export const fetchLocationInfo = (movie,year) => {
  return $.ajax({
    method: 'GET' ,
    url: `https://api.themoviedb.org/3/search/movie?api_key=00733eaa74c3c5021be9a3f9993f5a4b&language=en-US&query=${movie}&page=1&include_adult=false&year=${year}`
  })
}
