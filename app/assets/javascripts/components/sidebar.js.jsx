var Sidebar = React.createClass({
  render: function () {
      return (<div className = 'sidebar'>
          <ul><Link url = {'/login'} name = {'Assignments'}/></ul>
          <ul><Link url = {'/login'} name = {'Quizzes'}/></ul>
          <ul><Link url = {'/login'} name = {'Grades'}/></ul>
        </div>);
  }
});
