var Login = React.createClass({
  handleLogin(){
    var username = this.refs.username.value;
    var password = this.refs.password.value;
    $.ajax({
      url: '/api/v1/login',
      type: 'POST',
      data: { user: { username: username, password: password } },
      success: (reply) => {
        this.props.login(reply.user);
      },
      error: (error) => {
        this.props.login(error);
      }
    });
  },

  render() {
    return (
      <div className="login container">
        <input name='username' ref='username' placeholder='Rachio username' />
        <input name='password' type="password" ref='password' placeholder='password' />
        <button onClick={this.handleLogin}>Login</button>
      </div>
    );
  }
});
