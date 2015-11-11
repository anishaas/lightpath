var SubmitButton = React.createClass({
  getInitialState: function () {
    return {
      submitted: false
    };
  },

  handleClick: function (event) {
    var assignmentid = this.props.assignmentID;
      $.ajax({
        url: '/assignments/' + assignmentid + '/submissions',
        method: "POST",
        dataType: "JSON",
        data: {
          submission: {
            assignment_id: assignmentid,
            student_id: this.props.studentID,
            body: this.state.body,
          }
        }
          }).done(function () {
          this.setState({ submitted: true });
        }.bind(this));
  },

  changebody: function (e) {
    this.setState({ body: e.target.value });
  },

render: function () {
      if (this.state.submitted) {
          return (<div className=''>Submitted!</div>);
      } else {
          return(
          <div className='form'>
          <label htmlFor='Body'></label>
          <input id='Article' placeholder={'Submit your response here!'}
          size="50" type="string"
          onChange={this.changebody}
          value={this.state.body}
          className={this.state.className}/>
        <div className="btn" onClick={this.handleClick}>Submit</div>
        </div>);
    }
  }
});
