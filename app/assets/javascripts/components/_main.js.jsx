var Main = React.createClass({
  getInitialState(){
    return {user: {}, message: ""};
  },

  componentWillMount(){

  },

  login(user){
    if(user.username){
      this.setState({user: {username: user.username}, message: "Logged in as " + user.username});
    } else {
      this.setState({message: user.responseText});
    }
  },

  render() {
    return (
      <div>
        <Header message={this.state.message}/>
        <Body login={this.login} user={this.state.user}/>
      </div>
    );
  }
});
