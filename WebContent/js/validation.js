function validateAddForm(){
		var bus_num= document.add_details_form.bus_number.value;
		if (bus_num=="") {
			alert("Field cannot be blank!");
			return false;
		}else{
			return true;
		}
}
