var Lightbulbsbar = React.createClass({
  render: function () {
    var course_id = this.props.course.id;
    var lightbulbs = this.props.lightbulbs;
      return (
        <div className = 'lightbulbsbar'>
          <ul><h4>Your Lightbulb Moments</h4></ul>
        {
          lightbulbs.map(function (lightbulb, index) {
          return (
            <ul key={index}>
              <div className = 'lbimg'><img src ='http://s13.postimg.org/6n2pzw1zb/image.png'></img></div>
              <div className = 'lblinks'><Link url = {'/courses/' + course_id +'/lightbulb/' + lightbulb.id} name={lightbulb.summary}/></div>
            </ul>
            )
          })
        }
        </div>
      );
  }
});
