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
    return (<a className={this.state.className}
            onMouseOver={this.mouseOver}
            onMouseOut={this.mouseLeave}
            href={this.props.url}>{this.props.name}</a>);
  }
});
