function selectBuildingType() {
  let res = document.querySelector("#details #residential");
  let com = document.querySelector("#details #commercial");
  let corp = document.querySelector("#details #corporate");
  let hyb = document.querySelector("#details #hybrid");
  var buildingType = document.getElementById("building-type").value;

  if (res.hasAttribute("hidden") == false) {
    res.hidden = true;
  }
  if (com.hasAttribute("hidden") == false) {
    com.hidden = true;
  }
  if (corp.hasAttribute("hidden") == false) {
    corp.hidden = true;
  }
  if (hyb.hasAttribute("hidden") == false) {
    hyb.hidden = true;
  }

  if (buildingType == "residential") {
    res.removeAttribute("hidden");
  } else if (buildingType == "commercial") {
    com.removeAttribute("hidden");
  } else if (buildingType == "corporate") {
    corp.removeAttribute("hidden");
  } else if (buildingType == "hybrid") {
    hyb.removeAttribute("hidden");
  }
  clearAllInputs();
}

function detectInput(buildingType){
  if (buildingType == "residential"){
    if (detectResidentialInput()){
      getAQuote(buildingType) 
    }
  } else if (buildingType == "commercial"){
    if (detectCommercialInput()){
        getAQuote(buildingType)
    }
  } else if (buildingType == "corporate"){
        if(detectCorporateInput()){
          getAQuote(buildingType)
        }
  } else if (buildingType == "hybrid"){
          if(detectHybridInput()){
            getAQuote(buildingType)
          }
          
        }
      }
      
    
  

  function detectResidentialInput(){
    if ((document.getElementById("residential-apartment").value.length != 0) && (document.getElementById("residential-floors").value.length !=0) && (document.getElementById("residential-basements").value.length !=0)){
      return true;
    } else {
      return false;
    
    }
  }

  function detectCommercialInput(){
    console.log(document.getElementById("commercial-elevators").value.length);
    if (document.getElementById("commercial-elevators").value.length != 0){
      return true;
    } else {
      return false;
    }
  }

  
  

  function detectCorporateInput(){
    
    if ((document.getElementById("corporate-floors").value.length != 0) && (document.getElementById("corporate-basements").value.length != 0) && (document.getElementById("corporate-max-occupants").value.length != 0)){
      console.log(document.getElementById("corporate-floors").value.length != 0);
      console.log(document.getElementById("corporate-basements").value.length != 0)
      console.log(document.getElementById("corporate-max-occupants").value.length != 0)
      return true;
    } else {
      return false
    }
  }

  function detectHybridInput(){
    if ((document.getElementById("hybrid-floors").value.length != 0) && (document.getElementById("hybrid-basements").value.length != 0) && (document.getElementById("hybrid-max-occupants").value.length != 0)){
      return true;
    } else {
      return false
    }
  }

  function clearAllInputs(){
    var inputs = document.getElementsByTagName("input");

    for (var i = 0; i < inputs.length; i++){
      if(inputs[i].type == "number"){
        inputs[i].value = "";
      }
    }
    document.getElementById("show-elevatorCount").setAttribute("value", "");
    document.getElementById("show-unitPrice").setAttribute("value", "");
    document.getElementById("show-totalElevatorPrice").setAttribute("value", "");
    document.getElementById("show-installFee").setAttribute("value", "");
    document.getElementById("show-finalPrice").setAttribute("value", "");
  }

  $(':input[type="number"]').on('change', function(e){
    var min=parseFloat($(this).attr('min'));
    var max=parseFloat($(this).attr('max')); console.log(min,max,curr);
    var curr=parseFloat($(this).val()); 
    console.log(min,max,curr);
    if (curr > max) { $(this).val(max); var changed=true; }
    if (curr < min) { $(this).val(min); var changed=true; }
});
  

  function getAQuote(buildingType){
    var productLine = $('input[name="product"]:checked').val()
    var elevatorCount;

    
    // var form = document.getElementById("details");
    // console.log(form);
    // form.reset();
    

    if (buildingType == "commercial") {
      var elevatorCount = document.getElementById("commercial-elevators").value;
      calculateQuote(productLine, elevatorCount);
    } else if (buildingType == "residential"){
      calculateResidentialElevatorCount(productLine);
    } else {
      calculateCorpAndHybElevatorCount(buildingType, productLine);
    }
  }



  function calculateResidentialElevatorCount(productLine){
      var aptCount = +document.getElementById("residential-apartment").value;
      var floor = +document.getElementById("residential-floors").value;
      var base = +document.getElementById("residential-basements").value;
      var averageDoorsPerFloor = Math.ceil(aptCount / floor);
      var elevatorShafts = Math.ceil(averageDoorsPerFloor / 6);
      var columns;
      
      if (floor > 20){
        columns = Math.ceil((floor+base) / 20);
      } else {
        columns = 1;
      }
      
      var elevatorCount = elevatorShafts * columns;
      calculateQuote(productLine, elevatorCount);

  }

  function calculateCorpAndHybElevatorCount(buildingType, productLine){
    var floor;
    var base;
    var maxOccupant;

    if (buildingType == "corporate"){
      floor = +document.getElementById("corporate-floors").value;
      base = +document.getElementById("corporate-basements").value;
      maxOccupant = +document.getElementById("corporate-max-occupants").value;
    } else {
      floor = +document.getElementById("hybrid-floors").value;
      base = +document.getElementById("hybrid-basements").value;
      maxOccupant = +document.getElementById("hybrid-max-occupants").value;
    }

    var columns = Math.ceil((floor + base) / 20);
    var totalOccupant = Math.ceil((floor + base) * maxOccupant);
    var elevatorRequired = Math.ceil(totalOccupant / 1000);
    var elevatorPerColumn = Math.ceil(elevatorRequired / columns);
    var elevatorCount = Math.ceil(columns * elevatorPerColumn);

    
    
    console.log(floor, base, maxOccupant);

    console.log(columns, elevatorRequired, elevatorPerColumn, elevatorCount);

    calculateQuote(productLine, elevatorCount);
  }

  function calculateQuote(productLine, elevatorCount){
    var unitPrice;
    var totalElevatorPrice;
    var installFee;
    var finalPrice; 

    if (detectResidentialInput() || detectCommercialInput() || detectCorporateInput() || detectHybridInput()){
      if (productLine == "standard"){
      unitPrice = 7565;
      totalElevatorPrice = elevatorCount * unitPrice;
      installFee = totalElevatorPrice * 0.1;
    } else if (productLine == "premium"){
      unitPrice = 12345;
      totalElevatorPrice = elevatorCount * unitPrice;
      installFee = totalElevatorPrice * 0.13;
    } else if (productLine == "excelium"){
      unitPrice = 15400;
      totalElevatorPrice = elevatorCount * unitPrice;
      installFee = totalElevatorPrice * 0.16;
    }

    finalPrice = totalElevatorPrice + installFee;
    document.getElementById("show-elevatorCount").setAttribute("value", parseInt(elevatorCount).toLocaleString());
    document.getElementById("show-unitPrice").setAttribute("value", parseInt(unitPrice).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " $");
    document.getElementById("show-totalElevatorPrice").setAttribute("value", parseInt(totalElevatorPrice).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " $");
    document.getElementById("show-installFee").setAttribute("value", parseInt(installFee).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " $");
    document.getElementById("show-finalPrice").setAttribute("value", parseInt(finalPrice).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " $");
    }

    
  }