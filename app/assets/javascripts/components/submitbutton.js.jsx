var SubmitButton = React.createClass({
  getInitialState: function () {
    return {
      submitted: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/submissions',
        method: "POST",
        dataType: "JSON",
        data: {
          submission: {
            assignment_id: this.props.assignmentID,
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
          <label htmlFor='Body'>Submission Content</label>
          <input id='Article' placeholder={'Submit your response here!'}
          size="50" type="string"
          onChange={this.changebody}
          value={this.state.body}
          className={this.state.className}/>
          <div className="btn" onClick={this.handleClick}>Submit Assignment!</div>
        </div>
        );
    }
  }
});
