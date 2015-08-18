require 'rails_helper'

RSpec.describe Sock, type: :model do

  it { is_expected.to have_one(:order) }
  it { is_expected.to belong_to(:user) }

end
