module SocksHelper

  def fabric_collection
    ['cotton', 'angora', 'cashmere', 'wool', 'polyester', 'bamboo', 'spandex', 'mohair', 'lycra']
  end

  def size_collection
    ['small', 'average - women', 'average - men', 'extra large']
  end

  def height_collection
    ['ankle', 'low calf', 'mid-calf', 'knee-high', 'over-the-knee']
  end

  def index_caption_or_links(sock)
    if sock.order == nil || !sock.order.paid
      render partial: 'sock_order_links', locals: {sock: sock}
    elsif !sock.order.delivered
      "<p> You're order is on it's way </p>"
    elsif sock.order.closed
      "<p> Your order has been completed</p>"
    end
  end

end
