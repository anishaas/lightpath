var Link = React.createClass({
  getInitialState: function () {
    return {
      classNames: 'btn btn-primary'
    };
  },
  mouseOver: function () {
      this.setState({classNames: 'btn btn-default'});
    },
  mouseLeave: function () {
    this.setState({classNames: 'btn btn-primary'});
  },
  render: function () {
    return (
      <a href={this.props.url} className={this.state.className}
            onMouseOver={this.mouseOver}
            onMouseOut={this.mouseLeave}>{this.props.name}</a>);
  }
});
