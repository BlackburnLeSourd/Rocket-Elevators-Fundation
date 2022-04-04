$(document).ready(function(){
    showRelevantBuildingType();
 })
  

  function showRelevantBuildingType(){

      let buildingType = document.getElementById("quote_building_type").innerHTML;
      let no_of_apartments = document.getElementById("no_of_apartments");
      let no_of_floors = document.getElementById("no_of_floors");
      let no_of_basements = document.getElementById("no_of_basements");
      let no_of_businesses = document.getElementById("no_of_businesses");
      let no_of_parking_spaces = document.getElementById("no_of_parking_spaces");
      let no_of_elevator_cages = document.getElementById("no_of_elevator_cages");
      let max_of_occupants_per_floor = document.getElementById("max_of_occupants_per_floor");
      let no_of_hours_of_activities = document.getElementById("no_of_hours_of_activities");  
  
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