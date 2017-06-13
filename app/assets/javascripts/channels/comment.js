App.comment = App.cable.subscriptions.create("CommentChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data){
      var li = document.createElement("LI");
      li.className = "comment";

      var text = document.createTextNode(data.comment.body);
      var span = document.createElement("SPAN");
      span.appendChild(text);

      var a = document.createElement("A");
      a.className = "comment-user-username-link";
      a.href = "/" + data.comment.user_username;
      a.innerHTML = data.comment.user_username;

      li.appendChild(a);
      li.appendChild(span);
      document.getElementsByClassName("post-" + data.comment.post_id)[0].appendChild(li);
      document.getElementsByClassName("post-form-comment-input-" + data.comment.post_id)[0].value = "";
    }
  }
});
