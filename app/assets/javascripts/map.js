function initMap(mapData) {
    
    dataJson = JSON.stringify(mapData)
    mapDetails = JSON.parse(dataJson)

    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 4,
      center: { lat: mapDetails[1].lat, lng: mapDetails[1].lng },
    });

    const infoBox = createContentString(mapDetails);

    for (let i = 0; i < mapDetails.length; ++i) {
      const marker = new google.maps.Marker({
        position: {
          lat: mapDetails[i].lat,
          lng: mapDetails[i].lng,
        },
        map: map,
      });
  
      attachMarker(marker, infoBox[i]);
    }
    
}
 
function createContentString(mapDetails){
  var contentString = []
  for (let i = 0; i < mapDetails.length; ++i){
    var content =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
    '<h3 id="firstHeading" class="firstHeading">Building Location Details</h3>' +
    '<div id="bodyContent">' +
    "<h5>Location of the Building: " + mapDetails[i].address + "</h5>" + 
    "<h5>Number of floors in the building: " + mapDetails[i].floors + "</h5>" + 
    "<h5>Client name: " + mapDetails[i].client_name + "</h5>" + 
    "<h5>Number of Batteries: " + mapDetails[i].batteries + "</h5>" + 
    "<h5>Number of Columns: " + mapDetails[i].columns + "</h5>" + 
    "<h5>Number of Elevators: " + mapDetails[i].elevators + "</h5>" + 
    "<h5>Full name of technical contact: " + mapDetails[i].technical_contact + "</h5>" + 
    "</div>" +
    "</div>";

    contentString.push(content);
  }
  return contentString;

}
  // Attaches an info window to a marker with the provided message. When the
  // marker is clicked, the info window will open with the info box.
function attachMarker(marker, contentString) {
const infowindow = new google.maps.InfoWindow({
    content: contentString,
});

marker.addListener("click", () => {
    infowindow.open(marker.get("map"), marker);
});
}

