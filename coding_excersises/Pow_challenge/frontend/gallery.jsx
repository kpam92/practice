import React from 'react';

class Gallery extends React.Component {
   constructor(props){
     super(props);
     this.populateImages = this.populateImages.bind(this);
   }

  populateImages(){
    let currImages = this.randomImages().responseJSON
  }

  randomImages(){
    return $.ajax({
    url: 'http://www.splashbase.co/api/v1/images/latest'})
  }

   render(){
    return (
      <div>
      [ Active Gallery Image Here ]
      {/*Include thumbnails here*/}
    </div>
    )
    }
}

export default Gallery;
