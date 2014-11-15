module ApplicationHelper
  def is_admin?
   unless current_user && :user_signed_in? && current_user.admin?
      flash[:error] = "You must be admin logged in to access this section"
      redirect_to  new_user_session_path
      return true
    end
    true
  end

end
