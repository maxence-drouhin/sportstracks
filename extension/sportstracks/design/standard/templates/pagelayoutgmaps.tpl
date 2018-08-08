<!DOCTYPE html>
<html>
<head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="stylesheets/layouts/maps.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="stylesheets/layouts/main.css"/>
    <link rel="stylesheet" type="text/css" href="stylesheets/text.css"/>

    {literal}

        <script src="http://code.jquery.com/jquery-1.11.2.min.js"> </script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

            <script>


                Object.size = function(obj) {
                    var size = 0, key;
                    for (key in obj) {
                        if (obj.hasOwnProperty(key)) size++;

                    }

                    return size;
                };



                var map;

                function attachMarker(message, map, myLatlng, isOpened) {
                    //var message = ['This', 'is', 'the', 'secret', 'message'];
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map
                    });

                    var infowindow = new google.maps.InfoWindow({
                        content: message
                    });

                    google.maps.event.addListener(marker, 'click', function() {
                        infowindow.open(map, marker);
                    });
                    if(isOpened)
                        infowindow.open(map, marker);
                }


                function initialize() {
                    var mapOptions = {
                        zoom: 3,
                        center: new google.maps.LatLng(48.813000, 6.428827)
                    };


                    map = new google.maps.Map(document.getElementById('map-canvas'),
                            mapOptions);
                    //console.log(latLng[1]);
                    var latLongCoordinates = new Array();
                    var z=0;
                    var size;
                   // throw new Error("Something went badly wrong!");



                    var lastCoordinatesRow=false;
                    //console.log(size);
                    var lastGrName=null;
                    coordinatesRow = new Array();
                    // console.log(size);

                    var contentString ;
                    var countPastNames=0;

                  /*  $temp[] = array((string)$folder->name,
                            (string)$folder->Placemark->name,
                            (string)$folder->Placemark->styleUrl,
                            (string)$lineStringRow->coordinates,*/


                        var notFound =false;
                        coordinatesRow = new Array();



                            for (i = 0; i < markersArray.length; i++)
                            {
                                var coordinatesFullRow= new Array();
                                var coordinatesRow = markersArray[i][3];
                               // console.log(coordinatesRow);
                             //   console.log( coordinatesRow)
                              //  return;
                               // console.log(i);
                             //  console.log(markersArray[i]);
                                for (c = 0; c < coordinatesRow.length; c++)
                                {


                                   var splitedLatLng = coordinatesRow[c].split(',');
                                  //  if( splitedLatLng[0] != '' && splitedLatLng[1] !='')
                                var myLatlng = new google.maps.LatLng(splitedLatLng[0],splitedLatLng[1]);
//console.log(coordinates[c+1]+','+coordinates[c]);
//console.log(c);
//console.log(coordinatesRow[c]);
                                    if( c == 0 || c == coordinatesRow.length-1 ) {

                                      //  console.log(splitedLatLng[0]+','+splitedLatLng[1]);
                                        contentString = '<div id="content">' +
                                                markersArray[i][1] + '<br/>' +
                                                '</div>';
                                     //   attachMarker(contentString, map, myLatlng, true);

                                    }
                                    coordinatesFullRow.push(myLatlng);
                                //console.log(markersArray.coordinates[e]);
                                }
                               var flightPath = new google.maps.Polyline({
                                    path: coordinatesFullRow,
                                    geodesic: true,
                                    strokeColor: markersArray[i][2],
                                    strokeOpacity: 1.0,
                                    strokeWeight: 2
                                });

                                  flightPath.setMap(map);

                                // }



                            }
                            //console.log(coordinatesRow);








                }

                google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    {/literal}
</head>

<body>
<header class="maps_layout">
    <div class="box">
        <h3 class="purple main">Carte regroupant la matjortié des Chemins de Grandes Randonnées</h3>

        Carte reg<br/>roupant la matjortié des Chemins de Grandes RandonnéesCarte reg<br/>roupant la matjortié des Chemins de Grandes Randonnées
    </div>
</header>
{$module_result.content}
</body>


</html>
</html>


