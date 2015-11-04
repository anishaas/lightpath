var StudentLightbulbsbar = React.createClass({
  render: function () {
    var course_id = this.props.course.id;
    var lightbulbs = this.props.lightbulbs;
      return (
        <div className = 'studentslightbulbsbar'>
          <ul><h4>"Your Students' Lightbulbs"</h4></ul>
              {lightbulbs.map(function (lightbulb, index) {
                  (<ul key={index}>
                    <Link url={'/courses/' + course_id +'/lightbulb/' + lightbulb.id} name={lightbulb.summary}/>
                  </ul>);
                }
              }
        </div>);
      }
});
