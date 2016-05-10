var Zone = React.createClass({
  getInitialState(){
    return {
            seconds: "not currently running",
            message: "",
       activeButton: true,
      selectedToRun: false
    };
  },

  handleZoneStart(bool){
    duration = this.refs.duration.value;
    if(bool && 0 < duration && duration < 18000){
      this.setState({selectedToRun: duration, message: ""});
      this.toggleButtonActive(!bool);
    } else if (bool){
      this.setState({message: "Sorry, please enter a value between 0 and 18000 seconds"});
    } else {
      this.setState({selectedToRun: bool, message: ""});
      this.toggleButtonActive(!bool);
    }
  },

  run(){
    this.setState({
                     activeButton: true,
                          seconds: this.state.selectedToRun,
                    selectedToRun: false
                  });
  },

  toggleButtonActive(bool){
    this.setState({activeButton: bool});
  },

  startButton(){
    if(this.state.activeButton){
      return(<button onClick={() => this.handleZoneStart(true)}>Run this zone?</button>);
    } else {
      return(<button onClick={() => this.handleZoneStart(false)}>Ready to run!</button>);
    }
  },

  decrementSeconds(){
    if(this.state.seconds > 0){
      this.setState({seconds: this.state.seconds - 1});
    } else if (this.state.seconds !== "not currently running"){
      this.setState({seconds: "not currently running"});
    }
  },


  render() {
    return (
      <div>
        {this.props.zone.name}
        <div>Seconds remaining: {this.state.seconds}</div>
        <div>How many seconds would you like to run this zone? </div>
        <input type='number' min='0' name='duration' ref='duration' placeholder='seconds' />
        {this.startButton()} {this.state.message}
      </div>
    );
  }
});
