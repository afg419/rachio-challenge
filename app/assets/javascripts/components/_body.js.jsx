var Body = React.createClass({
  dashboardOrLogin(){
    if(this.props.user){
      return <RachioDashboard
                user={this.props.user}
                logout={this.props.logout}
             />;
    } else {
      return <Login
                login={this.props.login}
                setBodyState={this.setBodyState}
             />;
    }
  },

  render() {
    return (
      <div>
        {this.dashboardOrLogin()}
      </div>
    );
  }
});
