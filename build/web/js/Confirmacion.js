function confirmation() {
	var answer = confirm("¿Estas seguro de guardar?")
	if (answer){
            document.formulario.submit() 
	}
}

function confirmation2() 
     {
        if(confirm("Desea guardar cambios?"))
	{
	   return true;
	}
	else
	{
	   return false;
	}
     }