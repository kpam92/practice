import React from 'react';

import ReactDOM from 'react-dom';
import App from './component/app';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('content');

  ReactDOM.render(<App/>, root);

})
