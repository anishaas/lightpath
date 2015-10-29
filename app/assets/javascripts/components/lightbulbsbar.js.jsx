var Lightbulbsbar = React.createClass({
  render: function () {
    var course_id = this.props.course.id;
    var lightbulbs = this.props.lightbulbs;
      return (<div className = 'lightbulbsbar'>
        <ul><h4>Your Lightbulb Moments</h4></ul>
        {lightbulbs.map(function (lightbulb, index) {
          return (<ul key={index}><Link url = {'/courses/' + course_id +'/lightbulb/' + lightbulb.id} name={lightbulb.summary}/></ul>)
        })}
        </div>);
  }
});
