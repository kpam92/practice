import React from 'react';
import { withRouter } from 'react-router-dom';

class IndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const { fetchLocationDetail } = this.props
    const { title, release_year, latitude, longitude } = this.props.location

    fetchLocationDetail(title, release_year)
    this.props.handleIndexClick([latitude, longitude],this.props.id, title,release_year)
  }

  render() {
    const { title, locations, director, release_year } = this.props.location;
    return (
      <div
        className="location-index-item"
        onClick={this.handleClick}
      >
        <div className="index-item-info">
          <span className="index-item-category">Movie:</span>
          <span className="index-item-copy">{title}</span>
          <span className="index-item-copy">{release_year}</span>
          <span className="index-item-category">Director:</span>
          <span className="index-item-copy">{director}</span>
          <span className="index-item-category">Location:</span>
          <span className="index-item-copy">{locations}</span>
        </div>
      </div>
    );
  }
}

export default (IndexItem);
