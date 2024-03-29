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
		
		$("#root_category").bind("change",function(e){
			id = $(this).val();
			jQuery.getJSON("/json/get_sub_cat/"+id+".json",function(data){
				html = "";
				$.each(data,function(index,data){
					html += '<option value="'+data.category.id+'">'+data.category.name+"</option>";
				});
				
				$('#ad_category_id').html(html);
				
			})
		});
});