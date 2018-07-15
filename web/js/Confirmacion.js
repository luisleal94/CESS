function confirmation() {
	var answer = confirm("¿Estas seguro de guardar?")
	if (answer){
		//window.location = "http://www.google.com/";
		document.formulario.submit() 
	}
}