var Zone = React.createClass({
  getInitialState(){
    return {
            seconds: localStorage.getItem(this.props.zone.rachio_zone_id) || "not currently running",
            message: "",
       activeButton: true,
      selectedToRun: false
    };
  },


  decrementSeconds(){
    if(this.state.seconds > 0){
      this.setState({seconds: this.state.seconds - 1});
    } else if (this.state.seconds !== "not currently running"){
      this.setState({seconds: "not currently running"});
    }
  },

  startingAndWithinAcceptableRange(bool){
    maxDuration = 10800;
    duration = this.refs.duration.value;
    return bool && 0 < duration && duration < maxDuration;
  },

  handleZoneStart(bool){
    if(this.startingAndWithinAcceptableRange(bool)){
      this.setState({selectedToRun: duration, message: ""});
      this.toggleButtonActive(!bool);
    } else if (bool){
      this.setState({message: `Sorry, please enter a value between 0 and ${maxDuration} seconds`});
    } else {
      this.setState({selectedToRun: bool, message: ""});
      this.toggleButtonActive(!bool);
    }
  },

  run(){
    stop_spins(this.props.zone.rachio_zone_id);
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
      return(
        <div>
          <input
            className='duration-input-active'
            type='number'
            min='0'
            name='duration'
            ref='duration'
            placeholder='seconds'
          />
          <button name='runZone' onClick={() => this.handleZoneStart(true)}>
            Run this zone.
          </button>
        </div>
      );
    } else {
      return(
        <div>
          <input
            className='duration-input-inactive'
            type='number'
            min='0'
            name='duration'
            ref='duration'
            placeholder='seconds' readOnly
          />
          <button onClick={() => this.handleZoneStart(false)}>
            Ready to run!
          </button>
        </div>
      );
    }
  },

  render() {
    var className = "zone-" + this.props.zone.zoneNumber + " container" +
    " zone selected-" + this.state.activeButton;

    return (
      <div className={className}>
        <h5>{this.props.zone.name}</h5>
        <div>
          Seconds remaining: <span className="counter">{this.state.seconds}</span>
        </div>
        <div id={this.props.zone.rachio_zone_id}></div>
        <div>How many seconds would you like to run this zone? </div>
        {this.startButton()} {this.state.message}
      </div>
    );
  }
});
