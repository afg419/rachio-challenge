var RachioDashboard = React.createClass({
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
        <button onClick={this.handleLogout}>Logout</button>
      </div>
    );
  }
});
