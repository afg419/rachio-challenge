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
      deviceComp.zoneObjects().forEach(zone =>{
        zone.decrementSeconds();
      });
    }, 1000);
  },

  createZoneComponents(device){
    return device.zones.map((zone) => {
      return <Zone ref={zone.zoneNumber} key={zone.rachio_zone_id} zone={zone}/>;
    });
  },

  zoneObjects(){
    var deviceComp = this;
    return this.state.zones.map( zone => {
      return deviceComp.refs[zone.props.zone.zoneNumber];
    });
  },

  selectedZones(){
    return this.zoneObjects().filter( zone => {
      return zone.state.selectedToRun;
    });
  },

  selectedZonesAPIParams(){
    return this.selectedZones().map( (zone, ind) => {
      return {"id": zone.props.zone.rachio_zone_id, "duration": zone.state.selectedToRun, "sortOrder": ind + 1};
    });
  },

  startSelectedZones(){
    var selected = this.selectedZones();
    $.ajax({
      url: '/api/v1/devices/' + this.props.device.rachio_device_id,
      type: 'PUT',
      data: { zones: this.selectedZonesAPIParams() },
      success: (reply) => {
        selected.forEach( zone => {
          zone.run();
        });
      },
      error: (reply) => {
        console.log("Something went wrong...");
      }
    });
  },

  render() {
    return (
      <div>
        <h3>Device ID {this.props.device.rachio_device_id}</h3>
        <button onClick={this.startSelectedZones}>Start selected zones!</button>
        {this.state.zones}
      </div>
    );
  }
});
