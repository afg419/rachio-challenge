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
        // this.updateUserInfo();
      },
      error: (reply) => {
        this.props.login(reply);
      }
    });
  },

  // updateUserInfo(){
  //   $.ajax({
  //     url: '/api/v1/user',
  //     type: 'GET',
  //     success: (reply) => {
  //       this.props.login(reply.user);
  //     },
  //     error: (reply) => {
  //       this.props.login(reply);
  //     }
  //   });
  // },

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
