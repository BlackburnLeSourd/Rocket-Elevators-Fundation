
  function selectBuildingType() {
    showRelevantBuildingType()
    clearAllInputs();
  }

  function detectInput(){
    let buildingType = document.getElementById("quote_building_type").value;
    let productLine = $('input[name="quote[product_line]"]:checked').val()
    if (buildingType == "residential"){
        detectResidentialInput(productLine)
    } else if (buildingType == "commercial"){
      detectCommercialInput(productLine)
    } else {
      detectCorporateOrHybridInput(productLine)  
      }
  }

  function detectResidentialInput(productLine){
    let no_of_apartments = document.getElementById("quote_no_of_apartments").value;
    let no_of_floors = document.getElementById("quote_no_of_floors").value;
    let no_of_basements = document.getElementById("quote_no_of_basements").value;

    if ((no_of_apartments.length != 0) && (no_of_floors.length !=0) && (no_of_basements.length !=0)){
      calculateResidentialElevatorCount(productLine, no_of_apartments, no_of_floors, no_of_basements)
    } else {
      console.log("residential values not filled");
    }
  }

  function detectCommercialInput(productLine){
    let no_of_elevator_cages = document.getElementById("quote_no_of_elevator_cages").value;
    if (no_of_elevator_cages.length != 0){
      calculateQuote(productLine, no_of_elevator_cages)
    } else {
      console.log("commercial values not filled");
    }
  }

  
  

  function detectCorporateOrHybridInput(productLine){

    let no_of_floors = document.getElementById("quote_no_of_floors").value;
    let no_of_basements = document.getElementById("quote_no_of_basements").value;
    let max_of_occupants_per_floor = document.getElementById("quote_max_of_occupants_per_floor").value;

    if ((no_of_floors.length != 0) && ( no_of_basements.length != 0) && (max_of_occupants_per_floor.length != 0)){
      calculateCorpAndHybElevatorCount(productLine, no_of_floors, no_of_basements, max_of_occupants_per_floor)
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
    // document.getElementById("show-elevatorCount").setAttribute("value", "");
    // document.getElementById("show-unitPrice").setAttribute("value", "");
    // document.getElementById("show-totalElevatorPrice").setAttribute("value", "");
    // document.getElementById("show-installFee").setAttribute("value", "");
    // document.getElementById("show-finalPrice").setAttribute("value", "");
  }

//   $(':input[type="number"]').on('change', function(e){
//     var min=parseFloat($(this).attr('min'));
//     var max=parseFloat($(this).attr('max')); console.log(min,max,curr);
//     var curr=parseFloat($(this).val()); 
//     console.log(min,max,curr);
//     if (curr > max) { $(this).val(max); var changed=true; }
//     if (curr < min) { $(this).val(min); var changed=true; }
// });


  function calculateResidentialElevatorCount(productLine, aptCount, floor, base){
      var averageDoorsPerFloor = Math.ceil(aptCount / floor);
      var elevatorShafts = Math.ceil(averageDoorsPerFloor / 6);
      var columns;
      
      if (floor > 20){
        columns = Math.ceil((floor+base) / 20);
      } else {
        columns = 1;
      }
      
      var elevatorCount = elevatorShafts * columns;

      console.log(elevatorCount)
      calculateQuote(productLine, elevatorCount);

  }

  function calculateCorpAndHybElevatorCount(productLine, floor, base, maxOccupant){
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

    console.log(elevatorCount, unitPrice, totalElevatorPrice, installFee, finalPrice)
    document.getElementById("quote_no_of_elevators_needed").value = elevatorCount;
    document.getElementById("quote_unit_price").value = unitPrice;
    document.getElementById("quote_total_price_of_elevators").value = totalElevatorPrice.toFixed(2)
    document.getElementById("quote_installation_fees").value = installFee.toFixed(2);
    document.getElementById("quote_final_price").value = finalPrice.toFixed(2);
  }



function showRelevantBuildingType(){
    let buildingType = document.getElementById("quote_building_type").value;
    let no_of_apartments = document.getElementById("no_of_apartments");
    let no_of_floors = document.getElementById("no_of_floors");
    let no_of_basements = document.getElementById("no_of_basements");
    let no_of_businesses = document.getElementById("no_of_businesses");
    let no_of_parking_spaces = document.getElementById("no_of_parking_spaces");
    let no_of_elevator_cages = document.getElementById("no_of_elevator_cages");
    let max_of_occupants_per_floor = document.getElementById("max_of_occupants_per_floor");
    let no_of_hours_of_activities = document.getElementById("no_of_hours_of_activities");  

    no_of_apartments.hidden = true;
    no_of_floors.hidden = true;
    no_of_basements.hidden = true;
    no_of_businesses.hidden = true;
    no_of_parking_spaces.hidden = true;
    no_of_elevator_cages.hidden = true;
    max_of_occupants_per_floor.hidden = true;
    no_of_hours_of_activities.hidden = true;

    if (buildingType == "residential"){
      no_of_apartments.removeAttribute("hidden");
      no_of_floors.removeAttribute("hidden");
      no_of_basements.removeAttribute("hidden");
    }

    if (buildingType == "commercial"){
      no_of_businesses.removeAttribute("hidden");
      no_of_floors.removeAttribute("hidden");
      no_of_basements.removeAttribute("hidden");
      no_of_parking_spaces.removeAttribute("hidden");
      no_of_elevator_cages.removeAttribute("hidden");
    }

    if (buildingType == "hybrid" || buildingType == "corporate"){
      no_of_businesses.removeAttribute("hidden");
      no_of_floors.removeAttribute("hidden");
      no_of_basements.removeAttribute("hidden");
      no_of_parking_spaces.removeAttribute("hidden");
      no_of_elevator_cages.removeAttribute("hidden");
      max_of_occupants_per_floor.removeAttribute("hidden");
      no_of_hours_of_activities.removeAttribute("hidden");
    }
}

