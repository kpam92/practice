import React from 'react';

const ReviewShow = ({review}) => (
  <div key={review.id}>
    <ul className="review-list">
      <li>Rating: { review.rating }</li>
      <li>{ review.body }</li>
    </ul>
  </div>
)

export default ReviewShow;
