import React from 'react';
import GalleryThumb from './gallery_thumb';

class Gallery extends React.Component {
   constructor(props){
     super(props);
     this.state = {
       inactiveImages: [''],
       currIndex: 0
     }
     this.populateImages = this.populateImages.bind(this);
     this.setActiveImage = this.setActiveImage.bind(this);
     this.alternatePhoto = this.alternatePhoto.bind(this);
     this.changeIndexClick = this.changeIndexClick.bind(this);
     this.incrementTime = this.incrementTime.bind(this);
     this.incrementTime();
   }

   componentWillMount(){
     this.populateImages();
   }

   incrementTime() {
     setInterval(this.alternatePhoto, 3000)
   }

   alternatePhoto(){
     let {inactiveImages, currIndex} = this.state;
     let nextIdx = (currIndex + 1) % inactiveImages.length;
     this.setState({currIndex:nextIdx});
   }

  populateImages(){
    $.ajax({
      url: 'http://www.splashbase.co/api/v1/images/latest',
      success: (data => {return data})
    }).then(data => {
      this.setState({inactiveImages:data.images});
    });
  }

  setActiveImage(index) {
    let currImage = this.state.currImages[index];
    this.setState({activeImage:currImage});
  }

  changeIndexClick(idx) {
    // debugger;
    this.setState({currIndex:idx});

    // this.incrementTime();
  }
   render(){
     var { inactiveImages,currIndex } = this.state;
     const photoDetails = inactiveImages.map((photo,index) => (
       <GalleryThumb key={photo.id} photo={photo} index={index} changeIndex={this.changeIndexClick}/>
     )
    );
    var currentImage = inactiveImages[currIndex].url;
    return (
      <div>
        <img className='active-image'src={currentImage}/>
        {photoDetails}
      </div>
    )
    }
}

export default Gallery;
