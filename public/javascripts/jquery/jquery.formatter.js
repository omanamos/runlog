(function( $ ){
	$.fn.formatter = function(default_values) {
		
		// if nothing is selected, return nothing; can't chain anyway
		if (!this.length) {
			console.warn( "nothing selected, can't format, returning nothing" );
			return;
		}
		
		var methods = {
			focus: function(){
				$this = $(this);
				if($this.data('formatter').has_dummy){
					var offset = $this.offset();
					$this.hide().unbind('focus');
					$this.data('formatter').input.show().css(offset).focus().blur(methods.blur);
				}else{
					this.value = "";
					$this.removeClass("default_value").unbind('focus').blur(methods.blur);
				}
			},
			
			blur: function(){
				if(this.value == "" || this.value == $(this).data('formatter').default_value){
					$this = $(this);
					if($this.data('formatter').has_dummy){
						var offset = $this.offset();
						$this.hide().unbind('blur');
						$this.data('formatter').dummy.show().css(offset).focus(methods.focus);
					}else{
						this.value = $(this).data('formatter').default_value;
						$this.addClass("default_value").unbind('blur').focus(methods.focus);
					}
				}
			}
		};
		
		var def = {};
		this.each(function(){
			def[this.id] = this.value;
		});
		$.extend(def, default_values);
		
		this.each(function(){
			$this = $(this);
			if(!$this.data('formatter')){
				var has_dummy = $this.attr('type') == 'password';
				
				if(has_dummy){
					var offset = $this.offset();
					$.tmpl('<input id="dummy_${id}" class="default_value" name="dummy_${name}" type="text" value="${value}" maxlength="50" />', {
						id: this.id,
						name: $this.attr('name'),
						value: def[this.id]
					}).insertAfter($this);
					
					$this.val('');
					$this.hide();
					var dummy = $('#dummy_' + this.id);
					dummy.css(offset);
					
					$this.data('formatter',{
						has_dummy: has_dummy,
						dummy: dummy
					});
					$(dummy).data('formatter',{
						has_dummy: has_dummy,
						input: $this
					});
					
					dummy.focus(methods.focus);
				}else{
					$this.addClass("default_value");
					$this.val(def[this.id]);
					$this.data('formatter',{
						has_dummy: has_dummy,
						default_value: def[this.id]
					});
					$this.focus(methods.focus);
				}
			}
		});
	};
	$.fn.isDefault = function(){
		return $(this).data('formatter') && $(this).data('formatter').default_value == $(this).val()
	}
})( jQuery );

