require 'rails_helper'

RSpec.describe "socks/show", type: :view do
  before(:each) do
    @sock = assign(:sock, Sock.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
