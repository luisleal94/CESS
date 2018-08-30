function addRow() {  
  
  var table = document.getElementById("myTableData");

  var rowCount = table.rows.length;
  //alert(rowCount); //Obtengo el numero de filas en mi tabla
  var row = table.insertRow(rowCount);

  row.insertCell(0).innerHTML= '<input type="button" value = " X " onClick="Javacsript:deleteRow(this)">';
  row.insertCell(1).innerHTML= '<input class="BotonTa" placeholder="DD/MM/AA" type="text" id=idQ'+rowCount+'1 name=idQ'+rowCount+'1 >'; //myName.value;
  row.insertCell(2).innerHTML= '<input class="BotonTa" type="text" id=idQ'+rowCount+'2 name=idQ'+rowCount+'2 >';
  row.insertCell(3).innerHTML= '<input class="BotonTa" type="text" id=idQ'+rowCount+'3 name=idQ'+rowCount+'3 >';
  document.getElementById("Valor").value=rowCount;
}

function addRow2() {  
  
  var table = document.getElementById("myTableData2");

  var rowCount = table.rows.length;
  //alert(rowCount); //Obtengo el numero de filas en mi tabla
  var row = table.insertRow(rowCount);

  row.insertCell(0).innerHTML= '<input type="button" value = " X " onClick="Javacsript:deleteRow2(this)">';
  row.insertCell(1).innerHTML= '<input class="BotonTa" placeholder="DD/MM/AA" type="text" id=idA'+rowCount+'1 name=idA'+rowCount+'1 >'; //myName.value;
  row.insertCell(2).innerHTML= '<input class="BotonTa" type="text" id=idA'+rowCount+'2 name=idA'+rowCount+'2 >';
  document.getElementById("Valor2").value=rowCount;
}

function deleteRow(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("myTableData");
    table.deleteRow(index);
    
    var rowCount = table.rows.length;
    //alert(rowCount);
    document.getElementById("Valor").value=rowCount-1;
}

function deleteRow2(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("myTableData2");
    table.deleteRow(index);
    
    var rowCount = table.rows.length;
    //alert(rowCount);
    document.getElementById("Valor2").value=rowCount-1;
}

function load() {
   
  console.log("Page load finished");

}// JavaScript Document