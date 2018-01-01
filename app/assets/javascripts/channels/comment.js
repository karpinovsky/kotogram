App.comment = App.cable.subscriptions.create("CommentChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data){
      var currentUserId = $('.application-meta').data('current-user-id')

      $(".post-" + data.comment.post_id).append(
        '<li class="comment comment-' + data.comment.id + '">' +
        '<a class="comment-user-username-link" href="' + data.comment.user_username + '">' +
        data.comment.user_username + '</a>' +
        '<span>' + data.comment.body + '</span></li>'
      )

      if (data.comment.user_id === currentUserId) {
        $('.comment-' + data.comment.id).append(
          '<a class="comment-delete-link" rel="nofollow" data-method="delete" href="' + data.comment.user_username +
          '/p/' + data.comment.post_id + '/comments/' + data.comment.id + '">'
        )
      }

      $('.post-form-comment-input-' + data.comment.post_id).val('');
    }
  }
});
