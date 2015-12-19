var FavoriteButton = React.createClass({
  getInitialState: function () {
    return {
      favorited: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/favorites',
        method: "POST",
        dataType: "JSON",
        data: {
          favorite: {
            student_id: this.props.studentID,
            lightbulb_id: this.props.lightbulbID,
          }
        }
          }).done(function () {
          this.setState({ favorited: true });
        }.bind(this));
  },

  render: function () {
        if (this.state.favorited) {
            return
            (<div className="" onClick={this.handleClick}>Favorited</div>);
        } else {
            return(
                <div className="btn" id = "fave" onClick={this.handleClick}>Favorite</div>
          );
      }
  }
});
