require 'rails_helper'
require "cancan/matchers"

require_all File.expand_path '../ability/',  __FILE__

describe Ability do

  NC = [:new, :create]
  subject(:ability) { Ability.new(user) }

  it_behaves_like 'ability for User'

end
