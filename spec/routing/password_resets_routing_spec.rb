require 'rails_helper'

describe PasswordResetsController, type: :routing do
  describe "routing" do

    it "recognizes and generates #new" do
      expect(:get => "/password_resets/new").to route_to("password_resets#new")
    end

    it "recognizes and generates #edit" do
      expect(:get => "/password_resets/1/edit").to route_to("password_resets#edit", id: '1')
    end

    it "recognizes and generates #create" do
      expect(:post => "/password_resets").to route_to("password_resets#create")
    end

    it "recognizes and generates #update" do
      expect(:put => "/password_resets/1").to route_to("password_resets#update", id: '1')
    end

  end
end
