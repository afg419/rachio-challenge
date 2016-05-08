var Main = React.createClass({
  loginDOM(){

  },

  render() {
    return (
      <div>
        <Header />
        <Body loginDOM={this.loginDOM}/>
      </div>
    );
  }
});
