var Zone = React.createClass({
  getInitialState(){
    return {};
  },

  render() {
    return (
      <div>
        {this.props.zone.name}
      </div>
    );
  }
});
