require 'rails_helper'

RSpec.describe "socks/edit", type: :view do
  before(:each) do
    @sock = assign(:sock, Sock.create!())
  end

  it "renders the edit sock form" do
    render

    assert_select "form[action=?][method=?]", sock_path(@sock), "post" do
    end
  end
end
