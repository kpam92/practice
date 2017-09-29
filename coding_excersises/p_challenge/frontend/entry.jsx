import React from 'react';
import ReactDOM from 'react-dom';
import Sample from './sample';
document.addEventListener('DOMContentLoaded',() => {
  const root = document.getElementById('content');
  ReactDOM.render(<Sample/>,root)
})
