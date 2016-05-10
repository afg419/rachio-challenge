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
      deviceComp.zoneObjects().forEach( zone => {
        zone.decrementSeconds();
        localStorage.setItem(zone.props.zone.rachio_zone_id, zone.state.seconds);
      });
    }, 1000);
  },

  createZoneComponents(device){
    return device.zones.map( zone => {
      return <Zone ref={zone.zoneNumber} key={zone.rachio_zone_id} zone={zone}/>;
    }).sort( (z1, z2) => {
      return z1.props.zone.zoneNumber - z2.props.zone.zoneNumber;
    });
  },

  zoneObjects(){
    var deviceComp = this;
    return this.state.zones.map( zone => {
      var zoneNumber = zone.props.zone.zoneNumber;
      return deviceComp.refs[zoneNumber];
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
    selected.forEach( zone => {
      make_it_spin(zone.props.zone.rachio_zone_id);
    });

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
      <div className="device container">
        <h4 className="device-name">Device ID {this.props.device.rachio_device_id}</h4>
        <button className="start-zones" name='startZones' onClick={this.startSelectedZones}>Start selected zones!</button>
        {this.state.zones}
      </div>
    );
  }
});
