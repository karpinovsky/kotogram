class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast 'comment_channel', comment: comment
  end
end
