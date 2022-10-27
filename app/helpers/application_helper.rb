module ApplicationHelper

    def home_path
        logged_in? ? dashboard_path : root_path 
    end

end
