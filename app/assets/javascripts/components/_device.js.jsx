var Device = React.createClass({
  getInitialState(){
    return {zones: this.createZoneComponents(this.props.device)};
  },

  createZoneComponents(device){
    return device.zones.map((zone) => {
      return <Zone key={zone.rachio_zone_id} zone={zone}/>;
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
