window.addEvent('domready', function(){
	//First Example
	var poo = ['tm_head_rings','tm_head_earrings','tm_head_pendants','tm_head_collections','tm_head_necklaces','tm_head_healing'];
	try {
	for (cat_ in poo){
	var el = $(poo[cat_]),
		color = el.getStyle('backgroundColor');
	
	// We are setting the opacity of the element to 0.5 and adding two events
	$(poo[cat_]).set('opacity', 0.5).addEvents({
		mouseenter: function(){
			// This morphes the opacity and backgroundColor
			this.morph({
				'opacity': 1,
				'background-color': '#c6d880'
			});
		},
		mouseleave: function(){
			// Morphes back to the original style
			this.morph({
				opacity: 0.5,
				backgroundColor: color
			});
		} 
	});
	};
	}
	catch(e){
	}
	
	// Second Example
	try {
	for (p in poo) { 
	// The same as before: adding events
	$(poo[p]).addEvents({
		'mouseenter': function(){
			// Always sets the duration of the tween to 1000 ms and a bouncing transition
			// And then tweens the height of the element
			this.set('tween', {
				duration: 1000,
				transition: Fx.Transitions.Bounce.easeOut // This could have been also 'bounce:out'
			}).tween('height', '150px');
		},
		'mouseleave': function(){
			// Resets the tween and changes the element back to its original size
			this.set('tween', {}).tween('height', '20px');
		}
	}); }} catch (e){
	}});