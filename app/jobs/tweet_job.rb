class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # binding.irb
    # byebug
    # Best practice is NOT to cancel jobs but instead make them dynamic enough that
    # they don't do anything if they're no longer necessary
    return if tweet.published?

    # Rescheduled a twee to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
