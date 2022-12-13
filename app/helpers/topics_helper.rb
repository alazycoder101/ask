module TopicsHelper
  def options_for_topic
    Topic.all.map do |topic|
      [topic.name, topic.id]
    end.unshift(['', ''])
  end
end
