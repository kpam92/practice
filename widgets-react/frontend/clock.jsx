import React from 'react';

class Clock extends React.Component {
  constructor(props){
    super(props)
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
    this.clock_ticking_interval = (setInterval(  () => this.tick(),  1000  ));
  }

  tick(event) {
    this.setState({ time: new Date()})
  }

  componentDidMount() {
    this.clock_ticking_interval;
  }

  componentWillUnmount() {
    clearInterval(this.clock_ticking_interval);
  }

  render(){
    return(
      <div>
      <h1>CLOCK</h1>
      <span>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</span>
      </div>

    )
  }
}

export default Clock;
