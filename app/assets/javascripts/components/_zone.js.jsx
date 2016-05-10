var Zone = React.createClass({
  getInitialState(){
    return {seconds: "not currently running", message: "", activeButton: true};
  },

  handleZoneStart(){
    duration = this.refs.duration.value;
    if(0 < duration && duration < 18000){
      this.startZone(duration);
    } else {
      this.setState({message: "Sorry, please enter a value between 0 and 18000 seconds"});
    }
  },

  toggleButtonActive(bool){
    this.setState({activeButton: bool});
  },

  startButton(){
    if(this.state.activeButton){
      return(<button onClick={this.handleZoneStart}>Start</button>);
    } else {
      return(<button disabled>Starting up...</button>);
    }
  },

  startZone(duration){
    this.toggleButtonActive(false);
    $.ajax({
      url: '/api/v1/zones/' + this.props.zone.rachio_zone_id,
      type: 'PUT',
      data: { duration: duration },
      success: (reply) => {
        this.toggleButtonActive(true);
        this.setState({message: "Successfully started!"});
        // this.startCounter(duration);
      },
      error: (reply) => {
        console.log("Something went wrong...");
      }
    });
  },

  render() {
    return (
      <div>
        {this.props.zone.name}
        <div>{this.state.seconds}</div>
        <div>How many seconds would you like to run this zone? </div>
        <input type='number' min='0' name='duration' ref='duration' placeholder='seconds' />
        {this.startButton()} {this.state.message}
      </div>
    );
  }
});
