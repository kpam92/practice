import React from 'react';

const BenchDetail = ({rating, body}) => (
  <div>
    <ul className="review-list">
      <li>Rating: { rating }</li>
      <li>{ body }</li>
    </ul>
  </div>
);

export default BenchDetail;
