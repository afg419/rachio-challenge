var Login = React.createClass({
  render() {
    return (
      <div>
        <input name='username' ref='username' placeholder='Rachio username' />
        <input name='password' ref='password' placeholder='password' />
        <button>Login</button>
      </div>
    );
  }
});
