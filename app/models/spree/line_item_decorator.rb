Spree::LineItem.class_eval do
  
  # calculate amount for corporate (TODO: this may need to be revised for reporting to be the same as the profit)
  def margin_for_site
    product_costs = variant.product_costs.where(:retailer_id => order.retailer_id)
    (product_costs.empty? ? price : (price - product_costs.first.cost_price)) * quantity
  end
  
  # Handle case where the product cost for the retailer has not been defined yet
  def product_cost_for_retailer
    product_costs = variant.product_costs.where(:retailer_id => order.retailer_id)
    product_costs.empty? ? 0 : product_costs.first.cost_price * quantity
  end
  
  # Calulate the profit for a given line item based on the retailer's product costs
  # For routing purposes, we assume that the profit is zero if the product cost is not filled in.
  def profit(retailer)
    product_costs = variant.product_costs.where(:retailer_id => retailer.id)
    product_costs.empty? ? 0 : (price - product_costs.first.cost_price) * quantity
    
  end
  
  # Calculate any shipping surcharges for a line item,based on the shipping surcharges for the product
  def shipping_surcharge
    variant.product.shipping_surcharge * quantity
  end
  
  # Allows use to add arbitrary customization data to any line item
  # To be used with the Johnnie Walker Blue Label, might later replace with spree_flexi_variants
  # Example data: {:type => 'jwb_engraving, :data => {:line1 => 'bla', :line2 => 'said', :line3 => 'toad'}}
  # Can we derive partial names from the type? - I hope so.
  preference :customization, :string, :default => nil
  
end