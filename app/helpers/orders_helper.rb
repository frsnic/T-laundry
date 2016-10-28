module OrdersHelper

  def store_cloth_wash_ways(cloths)
    options = {}
    cloths.each do |cloth|
      options[cloth.title] = cloth.wash_ways.collect{ |wash_way| "#{wash_way.title} #{wash_way.price}"}
    end
    return options
  end

end
