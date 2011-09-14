$(function() {
		
		// force float
		$('.float-price').bind("blur",function(){
			var value = $(this).val();
			var isNumeric = /^[\d]+\.[\d]+$/;
			if(!isNumeric.test(value)){
				$(this).val(value.replace(/,/, "."));
				
			}
		});
		
		// word counter in ad description
		$('#ad_description').jqEasyCounter({
			'maxChars': 250
		});

		
		// Show subcategories dropdown for a specific root category
		
		$("#ad_root_cats_name").bind("change",function(e){
			id = $(this).val();
			jQuery.getJSON("http://localhost:3000/json/get_sub_cat/"+id+".json",function(data){
				html = "";
				$.each(data,function(index,data){
					html += '<option value="'+data.category.id+'">'+data.category.name+"</option>";
				});
				
				$('#ad_sub_cats_name').html(html);
				
			})
		});
});