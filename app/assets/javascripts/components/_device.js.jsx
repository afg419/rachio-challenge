var Device = React.createClass({
  getInitialState(){
    return {zones: this.createZoneComponents(this.props.device)};
  },

  componentDidMount(){
    this.timer();
  },

  timer(){
    var deviceComp = this;
    setInterval(() => {
      this.state.zones.forEach( zone => {
        zoneComp = deviceComp.refs[zone.props.zone.zoneNumber];
        zoneComp.decrementSeconds();
        zoneComp.setState({message: ""});
      });
    }, 1000);
  },

  createZoneComponents(device){
    return device.zones.map((zone) => {
      return <Zone ref={zone.zoneNumber} key={zone.rachio_zone_id} zone={zone}/>;
    });
  },

  render() {
    return (
      <div>
        <h3>Device ID {this.props.device.rachio_device_id}</h3>
        {this.state.zones}
      </div>
    );
  }
});
