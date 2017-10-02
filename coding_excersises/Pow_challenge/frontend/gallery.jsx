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
    //  debugger;
    //  let currImage = document.getElementById('active-image');
    //  currImage.id = 'change-image';
     let {inactiveImages, currIndex} = this.state;
     let nextIdx = (currIndex + 1) % inactiveImages.length;
     this.setState({currIndex:nextIdx});
    //  setTimeout(() => {currImage.id = 'active-image'},1000);

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
    // var lastIndex = currIndex - 1 >= 0 ? currIndex - 1 : currIndex + inactiveImages.length - 2;
    // var prevImage = inactiveImages.length > 0 ? inactiveImages[lastIndex].url : "https://www.oatey.com/ASSETS/WEB_THEMES//OATEY/images/NoImage.png";
    // <img className='last-image'src={currentImage}/>
    return (
      <div className='photos'>
        <div className='active-container'>
          <img id='active-image' src={currentImage}/>
        </div>
        {photoDetails}
      </div>
    )
    }
}

export default Gallery;
