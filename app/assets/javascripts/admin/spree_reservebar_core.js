//= require admin/spree_core
//= require admin/spree_auth
//= require_tree .

// Toggle Engraving
$(function(){
  $('#product_engravable').change(function() {
    if( $(this).attr('checked') == 'checked') {
      // Show engraving options
    }
    else {
      // Hide engraving options
    }
  });
});
