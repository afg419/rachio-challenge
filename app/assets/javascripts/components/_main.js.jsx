var Main = React.createClass({
  getInitialState(){
    return {user: this.props.user, message: this.props.message};
  },

  logout(){
    this.setState({user: undefined, message: "Logged out"});
  },

  login(user){
    if(user.username){
      this.setState({user: user, message: "Logged in as " + user.username});
    } else {
      this.setState({message: user.responseText});
    }
  },

  render() {
    return (
      <div>
        <Header message={this.state.message}/>
        <Body
          logout={this.logout}
          login={this.login}
          user={this.state.user}
        />
      </div>
    );
  }
});
