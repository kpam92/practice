import React from 'react';
import GalleryThumb from './gallery_thumb';

class Gallery extends React.Component {
   constructor(props){
     super(props);
     this.state = {
       activeImage : "",
       inactiveImages: []
     }
     this.populateImages = this.populateImages.bind(this);
     this.setActiveImage = this.setActiveImage.bind(this);
   }

   componentDidMount(){
     this.populateImages();
   }

  populateImages(){
    $.ajax({
      url: 'http://www.splashbase.co/api/v1/images/latest',
      success: (data => {return data})
    }).then(data => {
      this.setState({activeImage:data.images[0]});
      this.setState({inactiveImages:data.images.slice(1,data.images.length - 1)});
    });
  }

  setActiveImage(index) {
    let currImage = this.state.currImages[index];
    this.setState({activeImage:currImage});
  }

   render(){
     var { inactiveImages } = this.state;
     const photoDetails = inactiveImages.map(photo => (
       <GalleryThumb key={photo.id} photo={photo}/>
      )
    );
    return (
      <div>
      [ Active Gallery Image Here ]
      {/*Include thumbnails here*/}
      {photoDetails}
    </div>
    )
    }
}

export default Gallery;
