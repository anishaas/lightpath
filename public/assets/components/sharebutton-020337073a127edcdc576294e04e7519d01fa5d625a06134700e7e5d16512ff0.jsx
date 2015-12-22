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
            receiver_id: this.refs.queryClass.value,
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
            return (<div className="" onClick={this.handleClick}>Shared</div>);
        } else {
            return(
              <form action={"/courses/" + this.props.courseID + "/send_lightbulb"} accept-charset="UTF-8" method="post">
                <div class="searchclassmates">
                  <input class="search full width two" id="searchclassmates" ref='queryClass' name="queryclassmates" placeholder="Search for a classmate to share your lightbulb moment with!" />
                  <input class="search full width two" id="subjectline" ref='querySubject' name="querysubject" placeholder="Subject Line" />
                </div>
                <div className="btn" onClick={this.handleClick}>Share</div>
              </form>
          );
      }
  }
});
