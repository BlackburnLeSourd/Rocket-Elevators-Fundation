
// Apply eventListeners to required elements 
$( document ).ready(function() {  // Vérifie que le document est loadé


    let buildingTypeDropdown = $("#building-type") // Crée la variable buildingTypeDropdown

    // Affiche les bonnes questions
    $('#building-type').change(function() {                    // event listener = Écoute pour changement
        let buildingTypeValue = buildingTypeDropdown.val();    // Assigne à une variable la valeur du dropdown
        buildingType(buildingTypeValue)                        // Passe la valeur de cette variable dans la fonction   
        resetInputFields()
        resetForm()
    })   

    getInputFields().on("input", function() {
        autoRefreshFields()
        
    })
})

// REFRESH autocomplete (sans l'afficher)
function autoRefreshFields() {
    $('#eleAmount').val(getElevatorsNeeded());
    $("#unitPrice").val(getFormat(getUnitPrice()));
    $("#elevPice").val(getFormat(getElevatorsCostNoServices()));
    $("#instFees").val(getFormat(getInstallationsFees()));
    $("#finalPrice").val(getGrandPrice());
}

// Cache le formulaire
document.getElementById("number-of-apartments").style.display = "none"
document.getElementById("number-of-floors").style.display = "none"
document.getElementById("number-of-basements").style.display = "none"
document.getElementById("number-of-companies").style.display = "none"
document.getElementById("number-of-parking-spots").style.display = "none"
document.getElementById("number-of-elevators").style.display = "none"
document.getElementById("number-of-corporations").style.display = "none"
document.getElementById("maximum-occupancy").style.display = "none"
document.getElementById("business-hours").style.display = "none"
document.getElementById("quality").style.display = "none"

// Get input field - OKAY
function getInputFields() {
    let fields = $("#appartForResidential, #floorForResidential, #basementForResidential, #distinctBusiness, #parking, #numberOfElevator, #tenant-cie, #occupant, #hour, #quality")
    return fields;
}

// Get autocomplete Field
function getAutocompleteFields() {
    let autoCompletesfields = $("#eleAmount, #unitPrice, #elevPice, #instFees, #finalPrice")
    return autoCompletesfields
}

// Reset autoComplete fields
function resetForm() {
    return getFormat(getAutocompleteFields().val(0))
}

// Reset inputfiled fields
function resetInputFields() {
    return getInputFields().val(0)
}

function buildingType(typeofBuildingForDisplay){
        
    document.getElementById("number-of-apartments").style.display = "none"
    document.getElementById("number-of-floors").style.display = "none"
    document.getElementById("number-of-basements").style.display = "none"
    document.getElementById("number-of-companies").style.display = "none"
    document.getElementById("number-of-parking-spots").style.display = "none"
    document.getElementById("number-of-elevators").style.display = "none"
    document.getElementById("number-of-corporations").style.display = "none"
    document.getElementById("maximum-occupancy").style.display = "none"
    document.getElementById("business-hours").style.display = "none"
    document.getElementById("quality").style.display = "none"

    switch (typeofBuildingForDisplay) {
        case "residential":
            document.getElementById("number-of-apartments").style.display = "inline"
            document.getElementById("number-of-floors").style.display = "inline"
            document.getElementById("number-of-basements").style.display = "inline"
            document.getElementById("quality").style.display = "inline"
            break;
        case "commercial":
            document.getElementById("number-of-floors").style.display = "inline"
            document.getElementById("number-of-basements").style.display = "inline"
            document.getElementById("number-of-companies").style.display = "inline"
            document.getElementById("number-of-parking-spots").style.display = "inline"
            document.getElementById("number-of-elevators").style.display = "inline"
            document.getElementById("quality").style.display = "inline"
            break;
        case "corporate":
            document.getElementById("number-of-floors").style.display = "inline"
            document.getElementById("number-of-basements").style.display = "inline"
            document.getElementById("number-of-parking-spots").style.display = "inline"
            document.getElementById("number-of-corporations").style.display = "inline"
            document.getElementById("maximum-occupancy").style.display = "inline"
            document.getElementById("quality").style.display = "inline"
            break;
        case "hybrid":
            document.getElementById("number-of-floors").style.display = "inline"
            document.getElementById("number-of-basements").style.display = "inline"
            document.getElementById("number-of-companies").style.display = "inline"
            document.getElementById("number-of-parking-spots").style.display = "inline"
            document.getElementById("maximum-occupancy").style.display = "inline"
            document.getElementById("business-hours").style.display = "inline"
            document.getElementById("quality").style.display = "inline"
            break;

    }
    
}

// Type of Buildings -- OKAY
function getTypeOfBuilding() {
    let buildingTypeDropdown = $("#building-type")
    let buildingTypeValue = buildingTypeDropdown.val()
   // console.log("building type : " + buildingTypeValue)
    return buildingTypeValue
}

// Qualty -- OKAY
function getQuality() {
    let getquality = document.getElementsByName("radiobutton");
    
    for(i = 0; i < getquality.length; i++) {
        if(getquality[i].checked)
        return getquality[i].value;
    }
}

// ElevatorsNeeded
function getElevatorsNeeded() {
    
    let nbOfAppartments = parseInt($('#appartForResidential').val())
    let nbFloor = parseInt($("#floorForResidential").val())
    let nbBasement = parseInt($("#basementForResidential").val())
    let nbOccupantPerFloor = parseInt($("#occupant").val())
    let nbOfElevators = parseInt($("#numberOfElevator").val())
    let typeOfBuilding = getTypeOfBuilding()

    console.log("nb Apartment = " + (typeof(nbOfAppartments)))
    console.log("nb floor = " + (typeof(nbFloor)))
    console.log("nb nbBasement = " + (typeof(nbBasement)))
    console.log("nb elevator = " + (typeof(nbOfElevators)))
    console.log("type of building = " + (typeof(typeOfBuilding)))
    
    switch (typeOfBuilding) {
        case "residential":
            let avOfDoorPerFloor = parseInt(nbOfAppartments / (nbFloor - nbBasement))
            let ElevatorsPerSixAppartment = parseInt(Math.ceil(avOfDoorPerFloor / 6))
            let nbOfColumsNeeded = Math.ceil(nbFloor / 20)

            console.log("nb avOfDoorPerFloor = " + (typeof(avOfDoorPerFloor)))
            console.log("nb ElevatorsPerSixAppartment = " + (typeof(ElevatorsPerSixAppartment)))
            console.log("nb nbOfColumsNeeded = " + (typeof(nbOfColumsNeeded)))
                
          if (nbFloor < 20) {
            console.log("nb ElevatorsPerSixAppartment = " + (typeof(ElevatorsPerSixAppartment)))
             return parseInt(ElevatorsPerSixAppartment)
             
         } else {
             console.log("Residentiel  PLUS que 20  " + nbFloor)
             return ElevatorsPerSixAppartment * nbOfColumsNeeded
         }

        case "commercial":
            return nbOfElevators

        case "corporate" :
            let withBasements = nbFloor + nbBasement   
            let totalOccupants = withBasements * nbOccupantPerFloor
            let elevatorRequired = Math.round(totalOccupants / 1000)
            let nbColums = Math.round(withBasements / 20)
            let nbOfElevatorPerColums = Math.round(elevatorRequired / nbColums)
            let totalNumberOfElevators = nbOfElevatorPerColums * nbColums

            return totalNumberOfElevators

        case "hybrid" :
            let withBasement = nbFloor + nbBasement   
            let totalOccupant = withBasement * nbOccupantPerFloor
            let elevatorRequire = Math.round(totalOccupant / 1000)
            let nbColum = Math.round(withBasement / 20)
            let nbOfElevatorPerColum = Math.round(elevatorRequire / nbColum)
            let totalNumberOfElevator = nbOfElevatorPerColum * nbColum

            return totalNumberOfElevator;
    }   
}

// Unit Price -- OKAY
function getUnitPrice() {
    let typeOfQuality = getQuality()

    switch (typeOfQuality) {
        case "standard":
            return 7565
        case "prenium":
            return 12345
        case "excelium":
            return 15400
    }
}

// ElevatorsCostNoServices -- OKAT?
function getElevatorsCostNoServices() {
   let typeOfQuality = getQuality()

    switch (typeOfQuality) {
        case "standard":
           // console.log(7565 * getElevatorsNeeded())
            return 7565 * getElevatorsNeeded()
        case "prenium":
            return 12345 * getElevatorsNeeded()
        case "excelium":
            return 15400 * getElevatorsNeeded()
    }
}

// ÏnstalationFees
function getInstallationsFees() {
    let typeOfQuality = getQuality()
    let totalPrice = getElevatorsCostNoServices()

    if (typeOfQuality == "standard") {
       return (totalPrice * 0.10)
    } else if (typeOfQuality == "prenium") {
       return (totalPrice * 0.13)
    } else if (typeOfQuality == "excelium") {
        return (totalPrice * 0.16)
    }
}

// Calcul Grand prix
function getGrandPrice() {
    //console.log(getElevatorsNeeded() * getUnitPrice() + getInstalationsFees())
    return getFormat(getElevatorsNeeded() * getUnitPrice() + getInstallationsFees())  
}

// Formater $

function getFormat(toFormatt) {
    let formatter = new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'});
    return formatter.format(toFormatt) + " $"
        
}