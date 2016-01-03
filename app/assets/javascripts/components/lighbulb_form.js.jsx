var LightbulbForm = React.createClass ({
  getInitialState: function () {
    return {
      submitted: false
    };
  },

handleClick: function (event) {
      $.ajax({
      url: 'https://api.learningstudio.com/courses/12288063/webliographyEntries',
      method: "POST",
      dataType: "JSON",
      data: {
        event: {
          user_id: this.props.enrollmentID,
          room_id: this.props.studentID,
          duration: this.state.VideoURL,
          description: this.state.ArticleURL,
          start_time: this.state.Summary
          }
        }
          }).done(function () {
          this.setState({ submitted: true });
          }.bind(this));
  },

  changeVideoURL: function (e) {
    this.setState({ VideoURL: e.target.value });
  },

  changeArticleURL: function (e) {
    this.setState({ ArticleURL: e.target.value });
  },

  changeSummary: function (e) {
    this.setState({ Summary: e.target.value });
  },

  render: function () {
    if (this.state.submitted) {
        return (<div className=''>Lit!</div>);
    } else {
        return (
          <div className='form'>
            <label htmlFor='Video'>VideoURL</label>
            <input id='Start' placeholder={'Enter Video URL'}
                size="50" type="string"
                onChange={this.changeVideoURL}
                value={this.state.VideoURL}
                className={this.state.className}/>

              <label htmlFor='Article'>ArticleURL</label>
              <input id='Article' placeholder={'Enter Article URL'}
              size="50" type="string"
              onChange={this.changeArticleURL}
              value={this.state.ArticleURL}
              className={this.state.className}/>

            <label htmlFor='Summary'>Summary</label>
            <input id='Summary' type="string"
              onChange={this.changeSummary}
              value={this.state.Summary}
              className={this.state.className}/>

            <div className='btn btn-default btn-primary' onClick={this.handleClick}>Lightbulb It!</div>
          </div>
        );
    }
  }
});
