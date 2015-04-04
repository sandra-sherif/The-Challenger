module TaggingHelper
  def join_tags(challenge)
    challenge.tags.map { |t| t.name }.join(", ")
  end
end