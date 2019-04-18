function addRow() {  
  
  var table = document.getElementById("myTableData");

  var rowCount = table.rows.length;
  //alert(rowCount); //Obtengo el numero de filas en mi tabla
  var row = table.insertRow(rowCount);

  row.insertCell(0).innerHTML= '<input type="button" class="boton2" value = " X " onClick="Javacsript:deleteRow(this)">';
  row.insertCell(1).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'1 name=id'+rowCount+'1 >'; //myName.value;
  row.insertCell(2).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'2 name=id'+rowCount+'2 >';
  row.insertCell(3).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'3 name=id'+rowCount+'3 >';
  row.insertCell(4).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'4 name=id'+rowCount+'4 >';
  row.insertCell(5).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'5 name=id'+rowCount+'5 >';
  row.insertCell(6).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'6 name=id'+rowCount+'6 >';
  row.insertCell(7).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'7 name=id'+rowCount+'7 >';
  row.insertCell(8).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'8 name=id'+rowCount+'8 >';
  row.insertCell(9).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'9 name=id'+rowCount+'9 >';
  document.getElementById("Valor").value=rowCount;
}

function deleteRow(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("myTableData");
    table.deleteRow(index);
    
    var rowCount = table.rows.length;
    //alert(rowCount);
    document.getElementById("Valor").value=rowCount-1;
}

function AgregaRec(){
    var table = document.getElementById("Medicamentos");

  var rowCount = table.rows.length;
  //alert(rowCount); //Obtengo el numero de filas en mi tabla
  var row = table.insertRow(rowCount);

  row.insertCell(0).innerHTML= '<input type="button" class="boton2" value = " X " onClick="Javacsript:EliminaMed(this)">';
  row.insertCell(1).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'1 name=Medic'+rowCount+'1 >'; //myName.value;
  row.insertCell(2).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'2 name=Farm'+rowCount+'2 >';
  row.insertCell(3).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'3 name=Unid'+rowCount+'3 >';
  row.insertCell(4).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'4 name=Admin'+rowCount+'4 >';
  row.insertCell(5).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'5 name=Pres'+rowCount+'5 >';
  row.insertCell(6).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'6 name=Piez'+rowCount+'6 >';
  row.insertCell(7).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'7 name=Dos'+rowCount+'7 >';
  row.insertCell(8).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'8 name=Cad'+rowCount+'8 >';
  row.insertCell(9).innerHTML= '<input type="text" class="texto2" id=id'+rowCount+'9 name=Dia'+rowCount+'9 >';
  document.getElementById("CantidadMedic").value=rowCount;
}

function EliminaMed(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("Medicamentos");
    table.deleteRow(index);
    
    var rowCount = table.rows.length;
    //alert(rowCount);
    document.getElementById("CantidadMedic").value=rowCount-1;
}

function load() {
   
  console.log("Page load finished");

}// JavaScript Document