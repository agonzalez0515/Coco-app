module MessagesHelper

  def message_search(substring)
    substring = substring.gsub(/[^0-9a-z ]/i, "")
    @results = (Message.where("title like ?", "%#{substring}%") +
                Message.where("body like ?", "%#{substring}%"))
    @results.uniq
  end

end
