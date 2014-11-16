class ThesisDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def available
    if object.participants.size < object.participants.limit
      h.content_tag(:stong, object.title)
    else
      h.content_tag(:warning, object.title)
    end
  end
end
