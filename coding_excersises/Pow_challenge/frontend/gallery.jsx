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
     this.deleteImage = this.deleteImage.bind(this);
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
    this.setState({currIndex:idx});
  }
  deleteImage(idx) {
    let { currIndex } = this.state;

    let newIdx = currIndex;
    if (idx < currIndex) {
      newIdx -= 1
    };
    // debugger;

    let currImages = this.state.inactiveImages;
    currImages.splice(idx,1);
    this.setState({inactiveImages:currImages});
    this.setState({currIndex:newIdx});

  }
   render(){
     var { inactiveImages,currIndex } = this.state;
     const photoDetails = inactiveImages.map((photo,index) => (
       <GalleryThumb
        key={photo.id}
        photo={photo}
        index={index}
        changeIndex={this.changeIndexClick}
        deleteImage={this.deleteImage}
        />
     )
    );
    var currentImage = inactiveImages.length > 0 ? inactiveImages[currIndex].url : "https://www.oatey.com/ASSETS/WEB_THEMES//OATEY/images/NoImage.png";
    return (
      <div>
        <img className='active-image'src={currentImage}/>
        {photoDetails}
      </div>
    )
    }
}

export default Gallery;
