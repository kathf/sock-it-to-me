require 'rails_helper'

RSpec.describe "socks/index", type: :view do
  before(:each) do
    assign(:socks, [
      Sock.create!(),
      Sock.create!()
    ])
  end

  it "renders a list of socks" do
    render
  end
end
