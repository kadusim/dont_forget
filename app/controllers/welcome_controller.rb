class WelcomeController < ApplicationController

  def home
    have_lists = current_user && current_user.list.count > 0
    if have_lists
        redirect_to lists_path
    end
  end

end
