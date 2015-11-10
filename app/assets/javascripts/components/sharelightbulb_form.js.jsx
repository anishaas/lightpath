var ShareLightbulbForm = React.createClass({
  getInitialState: function () {
    return {
      shared: false
    };
  },
//AJAX Request
  handleClick: function (event) {
    var assignment_id = this.props.assignmentID;
      $.ajax({
        url: '/messages',
        method: "POST",
        dataType: "JSON",
        data: {
          queryclassmates: this.state.recipientID,
          lightbulbID: this.props.lightbulbID,
          message: {
            sender_id: this.props.senderID,
            subject: this.state.subject,
          }
        },
          success: function () {
          console.log('succeeded!');
          this.setState({ shared: true });
      }.bind(this),
      error: function () {
        console.log('error occured');
        this.setState({ shared: true });
        }.bind(this),
      }
      );
      },

//Setting state of component to user inputs
  changeRecipient: function (e) {
    this.setState({ recipientID: e.target.value });
  },

  changeSubject: function (e) {
    this.setState({ subject: e.target.value });
  },

  render: function () {
    if (this.state.shared) {
        return (<div className=''>Shared!</div>);
    } else {
        return (
            // <div className='btn btn-default' onClick={this.handleClick}>Create A Lightbulb</div>
            <div className='form'>
              <label htmlFor='Recipient'>Recipient</label>
              <input id='Recipient' placeholder={'Search for a classmate to share your lightbulb with!'}
                  size="50" type="string"
                  onChange={this.changeRecipient}
                  value={this.state.Recipient}
                  className={this.state.className}/>

                <label htmlFor='Send A Note'>Send A Note</label>
                <input id='Subject' placeholder={'Send a note with your lightbulb!'}
                size="50" type="string"
                onChange={this.changeSubject}
                value={this.state.Subject}
                className={this.state.className}/>

              <div className='btn btn-default btn-primary' onClick={this.handleClick}>Share</div>
            </div>
        );
    }
  }
});
