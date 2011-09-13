$(function() {
	
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