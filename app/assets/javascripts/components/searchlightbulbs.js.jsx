var SearchbarLightbulbs = React.createClass({
  getDefaultProps: function () {
   return {
     lightbulbs: []
  };
},
//initialize component as an empty array
  getInitialState: function () {
    return {
      lightbulbs: this.props.lightbulbs,
      search: ''
    };
  },
//on change of the field, filter the array with what's passed in?
  handleChange: function (event) {
  varNewLightbulbs = this.props.lightbulbs.filter(function (lightbulb) {
      return (lightbulb.name.toLowerCase().indexOf(event.target.value.toLowerCase()) > -1);
    });
    this.setState({
      search: event.target.value,
      lightbulbs: NewLightbulbs
    });
  },

  render: function() {
    return (<section>
      <input className='form-control' type='text'
        onChange={this.handleChange} value={this.state.search}
        placeholder="Search lightbulbs for this course! Type in an assignment!"/>
      {this.state.lightbulbs.map(function (lightbulb) {
          return (<Lightbulb lightbulb={lightbulb} />);
        })}
    </section>);
  }
});
