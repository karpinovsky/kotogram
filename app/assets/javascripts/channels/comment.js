App.comment = App.cable.subscriptions.create("CommentChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data){
      $(".post-" + data.post).append(data.comment)
      $(".post-form-comment-input-" + data.post).val("");
    }
  }
});
