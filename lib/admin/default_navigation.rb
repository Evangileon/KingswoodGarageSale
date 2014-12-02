require 'admin/navigation_manager'

#
# This is the default navigation manager for the admin interface.
#
module Admin
  NavigationManager.build(:admin_primary) do
    add_item :customer_orders
    add_item :products
    add_item :product_categories
    add_item :users
    #add_item :settings
  end
end