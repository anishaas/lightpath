var Lightbulbsbar = React.createClass({
  render: function () {
    var course_id = this.props.courseID
    var lightbulb_id = this.props.lightbulbID
    var lightbulb_summary = this.props.lightbulbSummary
      return (<div className = 'lightbulbsbar'>
          <ul><h4>Your Lightbulb Moments</h4></ul>
          <ul><Link url = {'/courses/' + course_id +'/lightbulb/' + lightbulb_id} name = {lightbulb_summary}/></ul>
          <ul><Link url = {'/courses/' + course_id +'/lightbulb/' + 2} name = {"Contrast Peter Keating and Howard Roark."}/></ul>
        </div>);
  }
});
