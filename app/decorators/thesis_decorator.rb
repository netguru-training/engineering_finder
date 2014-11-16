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
  def css_available_class
   #if object.participants_limit.to_i < object.participants.count
    if object.participants.count < object.participants_limit.to_i
      'success'
    else
      'danger'
    end
  end
end
