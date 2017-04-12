import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/root';
import Clock from './frontend/clock';


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('root'));
});
