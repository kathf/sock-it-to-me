require 'rails_helper'

RSpec.describe "socks/new", type: :view do
  before(:each) do
    assign(:sock, Sock.new())
  end

  it "renders new sock form" do
    render

    assert_select "form[action=?][method=?]", socks_path, "post" do
    end
  end
end
