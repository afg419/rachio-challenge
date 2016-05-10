var RachioDashboard = React.createClass({
  getInitialState(){
    return {devices: this.createDeviceComponents(this.props.user)};
  },

  createDeviceComponents(user){
    return user.devices.map((device) => {
      return <Device key={device.rachio_device_id} device={device}/>;
    });
  },

  handleLogout(){
    $.ajax({
      url: '/api/v1/login',
      type: 'DELETE',
      success: (reply) => {
        this.props.logout();
      }.bind(this),
      error: (reply) => {
        console.log(reply);
      }
    });
  },

  render() {
    return (
      <div>
        <button className='logout' onClick={this.handleLogout}>Logout</button>
        {this.state.devices}
        <div className='vertical-buffer'></div>
      </div>
    );
  }
});
