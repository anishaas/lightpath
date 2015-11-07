var ShareButton = React.createClass({
  getInitialState: function () {
    return {
      shared: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/messages',
        method: "POST",
        dataType: "JSON",
        data: {
          message: {
            sender_id: this.props.senderID,
            receiver_id: this.props.receiverID,
            subject: this.props.subject,
            body: this.props.body,
          }
        }
          }).done(function () {
          this.setState({ shared: true });
        }.bind(this));
  },

  render: function () {
        if (this.state.shared) {
            return (<div className="" onClick={this.handleClick}>Share</div>);
        } else {
            return(
            <div className="btn" onClick={this.handleClick}>Share</div>
          );
      }
  }
});
