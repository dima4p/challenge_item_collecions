require 'rails_helper'

describe ActivationsController, type: :routing do
  describe "routing" do

    it "recognizes and generates #create" do
      expect(get: "/activate/code").to route_to("activations#create", code: 'code')
    end

  end
end
