var Lightbulb = React.createClass({
  render: function () {
    var lightbulb = this.props.lightbulb;
    return (
      <div className='lightbulb col-md-4'>
        <p>Test</p>
        <p className='title'>
          <a href={'/lightbulbs/' + lightbulb.id}>{lightbulb.summary}</a>
          {lightbulb.id}
        </p>
       </div>
    );
  }
});
