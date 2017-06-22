import React from 'react';


class LocationDetail extends React.Component {
  constructor(props){
    super(props)
  }


  render(){
    const { movie, focus } = this.props
    const title = focus !== null ? focus.title : ""
    const year = focus !== null ? focus.release_year : ""
    const director = focus !== null ? focus.director : ""
    const actor1 = focus !== null ? focus.actor_1 : ""
    const actor2 = focus !== null ? focus.actor_2 : ""
    return(
      <div className='movie-detail col-sm-12 no-left'>
        <div className='col-sm-5 no-left'>
          <img src={"https://image.tmdb.org/t/p/w1280" + movie.poster_path}/>
        </div>
        <div className='col-sm-7'>
          <div className='col-sm-8'><h2>{title}</h2></div>
          <div className='col-sm-4'><h3>{year}</h3></div>
          <div className='col-sm-12'><h4>{director}</h4></div>
          <div className='col-sm-6'><h4>{actor1}</h4></div>
          <div className='col-sm-6'><h4>{actor2}</h4></div>
          <div className='col-sm-12'>{movie.overview}</div>
          <div className='col-sm-12'></div>

        </div>
      </div>
    )
  }
}


export default LocationDetail;
