import React from 'react';

class GalleryThumb extends React.Component {
	/* Thumbnails */
  constructor(props) {
    super(props)
  }

  render(){
    var {changeIndex,index } = this.props;
    var {url, large_url} = this.props.photo;
    return(
      <img className="thumbnails" src={url} onClick={() => changeIndex(index)}/>
    )
  }
}

export default GalleryThumb;
