(function( $ ){
	$.fn.toggleChecked = function(){
		return this.each(function(){
			this.checked = !this.checked;
		});
	}
})( jQuery );
