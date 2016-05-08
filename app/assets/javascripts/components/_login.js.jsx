var Login = React.createClass({
  handleLogin(){
    var username = this.refs.username.value;
    var password = this.refs.password.value;
    $.ajax({
      url: '/api/v1/login',
      type: 'POST',
      data: { user: { username: username, password: password } },
      success: (user) => {
        this.props.login(user);
      },
      error: (reply) => {
        console.log(reply.responseText);
      }
    });
  },

  render() {
    return (
      <div>
        <input name='username' ref='username' placeholder='Rachio username' />
        <input name='password' ref='password' placeholder='password' />
        <button onClick={this.handleLogin}>Login</button>
      </div>
    );
  }
});
