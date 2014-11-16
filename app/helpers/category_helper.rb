module CategoryHelper
  def highlight? index
    'highlight' if params[:id].to_i == index + 1
  end
end
