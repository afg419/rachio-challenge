var Body = React.createClass({
  getInitialState(){
    return {message: ""};
  },

  setBodyState(state){
    this.setState(state);
  },

  loggedIn(){
    if(this.props.user){
      return <button>Logout</button>;
    } else {
      return <Login login={this.props.login} setBodyState={this.setBodyState}/>;
    }
  },

  render() {
    return (
      <div>
        {this.state.message}
        {this.loggedIn()}
      </div>
    );
  }
});
