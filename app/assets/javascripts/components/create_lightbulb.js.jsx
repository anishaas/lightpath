// var CreateLightBulbForm = React.createClass({
//   getInitialState: function () {
//     return {
//       submitted: false
//     };
//   },
// //AJAX Request
//   handleClick: function (event) {
//     var assignment_id = this.props.assignmentID;
//       $.ajax({
//         url: '/lightbulbs',
//         method: "POST",
//         dataType: "JSON",
//         data: {
//           lightbulb: {
//             assignment_id: this.props.assignmentID,
//             course_id: this.props.courseID,
//             summary: this.state.VideoURL,
//             article_url: this.state.ArticleURL,
//             video_url: this.state.VideoURL,
//           }
//         }
//           }).done(function () {
//           this.setState({ submitted: true });
//         }.bind(this));
//   },
// //Setting state of component to user inputs
//   changeVideoURL: function (e) {
//     this.setState({ VideoURL: e.target.value });
//   },
//
//   changeArticleURL: function (e) {
//     this.setState({ ArticleURL: e.target.value });
//   },
//
//   changeSummary: function (e) {
//     this.setState({ Summary: e.target.value });
//   },
//
//   render: function () {
//     if (this.state.submitted) {
//         return (<div className=''>Lit!</div>);
//     } else {
//         return (
//             // <div className='btn btn-default' onClick={this.handleClick}>Create A Lightbulb</div>
//               <div id="modal1" className="modal">
//                 <div class="modal-content">
//                   <h3>Lightbulb It!</h3>
//                     <div className='form'>
//                       <p>
//                       <label htmlFor='Summary'>Summary</label>
//                       <input id='Summary' placeholder={'Summarize the concept in your own words'}
//                           size="50" type="string"
//                           onChange={this.changeSummary}
//                           value={this.state.Summary}
//                           className={this.state.className}/>
//                         </p>
//                         <p>
//                         <label htmlFor='Start'>Video URL</label>
//                       <input id='VideoURL' placeholder={'Was there a video that helped?'}
//                         size="50" type="string"
//                         onChange={this.changeVideoURL}
//                         value={this.state.VideoURL}
//                         className={this.state.className}/>
//                       </p>
//                       <p>
//                       <label htmlFor='ArticleURL'>Article URL</label>
//                       <input id='ArticleURL' placeholder={'Was there a video that helped?'}
//                         size="50" type="string"
//                         onChange={this.changeArticleURL}
//                         value={this.state.ArticleURL}
//                         className={this.state.className}/>
//                       </p>
//                     <a href= "#modal1" class="modal-trigger btn" onClick={this.handleClick}>Create A Lightbulb!></a>
//                   </div>
//                 </div>
//                 <div class="modal-footer">
//                       <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
//                 </div>
//               </div>
//         );
//     }
//   }
// });
