var Body = React.createClass({
  getInitialState(){
    return {};
  },

  loggedIn(){
    if(this.state.user){
      return "Hey";
    } else {
      return <Login />;
    }
  },

  render() {
    return (
      <div>
        {this.loggedIn()}
      </div>
    );
  }
});
