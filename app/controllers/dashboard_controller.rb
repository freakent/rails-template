class DashboardController < ApplicationController
  def index
    @actions = []
    @actions << CardAction.new("Things", things_path, 'iot-gd672b7eda_640.jpg', "Work with things in this application. Things can be anything you want.") 

  end
end
