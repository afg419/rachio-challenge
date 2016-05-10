var Header = React.createClass({
  render() {
    return (
      <div className="header container">
        <h1>Rachio Zone Controller</h1>
        <h3>{this.props.message}</h3>
      </div>
    );
  }
});
