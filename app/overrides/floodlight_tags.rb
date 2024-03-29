# Insert on cart page
Deface::Override.new(:virtual_path => "spree/orders/edit",
	                   :name => "floodlight_cart",
	                   :insert_before => "h1",
	                   :partial => "spree/floodlight_tags/cart",
	                   :disabled => false)

# Insert on checkout page for addresses - state dependency is handled in the partial
Deface::Override.new(:virtual_path => "spree/checkout/edit",
	                   :name => "floodlight_checkout",
	                   :insert_before => "#checkout",
	                   :partial => "spree/floodlight_tags/checkout",
	                   :disabled => false)

# Insert on checkout page for delivery - state dependency is handled in the partial
Deface::Override.new(:virtual_path => "spree/checkout/edit",
	                   :name => "floodlight_checkout_delivery",
	                   :insert_before => "#checkout",
	                   :partial => "spree/floodlight_tags/checkout_delivery",
	                   :disabled => false)

# Insert on checkout page for payment - state dependency is handled in the partial
Deface::Override.new(:virtual_path => "spree/checkout/edit",
	                   :name => "floodlight_checkout_payment",
	                   :insert_before => "#checkout",
	                   :partial => "spree/floodlight_tags/checkout_payment",
	                   :disabled => false)


# Insert on order summary page 
Deface::Override.new(:virtual_path => "spree/orders/show",
	                   :name => "floodlight_order_summary",
	                   :insert_before => "#order",
	                   :partial => "spree/floodlight_tags/orders_show",
	                   :disabled => false)

# Insert on checkout/registration page 
Deface::Override.new(:virtual_path => "spree/checkout/registration",
	                   :name => "floodlight_checkout_registration",
	                   :insert_before => "#registration",
	                   :partial => "spree/floodlight_tags/checkout_registration",
	                   :disabled => false)

# Insert on taxon page - taxon dependency is handled in the partial
Deface::Override.new(:virtual_path => "spree/taxons/show",
	                   :name => "floodlight_taxon_show",
	                   :insert_before => ".taxon-title",
	                   :partial => "spree/floodlight_tags/taxon_show",
	                   :disabled => false)

# Insert for Gifts by Holiday, Father's Day, and Cinco de Mayo
Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "floodlight_gifts_by_holiday",
                     :insert_top => "body",
                     :partial => "spree/floodlight_tags/gifts_by_holiday",
                     :disabled => false)

# Insert for Spirits - Tequila
Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "floodlight_spirits_tequila",
                     :insert_top => "body",
                     :partial => "spree/floodlight_tags/spirits_tequila",
                     :disabled => false)
