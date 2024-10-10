class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :set_categories

end


private

def set_categories
  @categories = Category.all
end


