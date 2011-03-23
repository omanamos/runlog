(function( $ ){
	$.fn.addToCart = function(){
		var itemTemplate = '' +
		'<form id="item_add_#{asin}" style="display: none;" method="post" action="https://fresh.amazon.com/ShoppingCartView" target="shopping-cart" class="addToCartForm">'
			'<input type="hidden" name="addCartRefer" value="#{addCartRefer}">' +
			'<input type="hidden" name="restriction" value="#{restriction}">' +
			'<input type="hidden" name="action" value="addItem">' +
			'<input name="quantity" type="text" value="#{quantity}" size="3" autocomplete="off" maxlength="3">' +
      		'<input type="hidden" name="qid" value="#{qid}">' +
			'<input type="hidden" name="rank" value="#{rank}">' +
			'<input type="hidden" name="sr" value="#{sr}">' +
			'<input type="hidden" name="asin" value="#{asin}">' +
			'<input type="hidden" name="refId" value="#{refId}">' +
			'<input type="image" value="submit" align="absmiddle" src="http://g-ecx.images-amazon.com/images/G/01/omaha/images/buttons/btn-addToCart-md-primary.gif" alt="Add To Cart" title="Add To Cart">' +
		'</form>';
		var items = this;
		var methods = {
			addItems: function(items){
				if(items.length != 0){
					$('#amzcart').append('<iframe id="item_add" name="item_add" src="https://fresh.amazon.com/product?asin=' + items[0].asin + '"></iframe>');
					$('#item_add').load(function(){ methods.pageReady($(items).toArray()); });
				}
			},
			pageReady: function(items){
				var item = items.shift();
				$.tmpl(itemTemplate, item).appendTo('#amzcart');
				$('#item_add_' + item.asin).submit();
				$('#item_add body #shopping-cart').load(function(){ methods.addItems(items); });
			}
		};
		$('body').append('<div id="amzcart"><a id="fb_iframe" title="Please Sign In To Amazon Fresh" href="https://fresh.amazon.com/SignIn">Sign In</a></div>');
		$('#fb_iframe').fancybox({
			width: '100%',
			height: '100%',
			type: 'iframe',
			onClosed: function(){
				 methods.addItems(items);
			}
		});
		$('#fb_iframe').trigger('click');
	}
})( jQuery );
