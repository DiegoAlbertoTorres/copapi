function buttonClicked() {
 
                        var report = document.getElementById("type").value;
                        var longitud = document.getElementById("longitud").value;
                        var latitud = document.getElementById("latitud").value;
                        var minDate = document.getElementById("minDate").value;
                        var maxDate = document.getElementById("maxDate").value;
 
                        var query = "?"//"localhost:3000?";
                        var first = true;
 
                        if (report != "") {
                                if (first) {
                                        query += "report=" + report;
                                        first = false;
                                } else {
                                        query += "&report=" + report;
                                }
                        }
 
                        if (minDate != "") {
                                if (first) {
                                        query += "min" + parseDate(minDate);
                                        first = false;
                                } else {
                                        query += "&min" + parseDate(minDate);
                                }
                        }
 
                        if (maxDate != "") {
                                if (first) {
                                        query += "max" + parseDate(maxDate);
                                        first = false;
                                } else {
                                        query += "&max" + parseDate(maxDate);
                                }
                        }
 
                        var radius = 0.1;
                        if (longitud != "") {
                                if (first) {
                                        query += "maxLon=";
                                        first = false;
                                } else {
                                        query += "&maxLon=";
                                }
 
                                query += (parseFloat(longitud) + radius) + "&minLon=" + (parseFloat(longitud) - radius);
                        }
 
                        if (latitud != "") {
                                if (first) {
                                        query += "maxLat=";
                                        first = false;
                                } else {
                                        query += "&maxLat=";
                                }
 
                                query += (parseFloat(latitud) + radius) + "&minLat=" + (parseFloat(latitud) - radius);
                        }
 
                        console.log(query);
 
                        search(query);
                }
 
                function parseDate(dateStr) {
                        var dateArr = dateStr.split("/");
 
                        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
 
                        if (dateArr[2] < 25) {
                                var year = "/20" + dateArr[2];
                        } else {
                                var year = "/19" + dateArr[2];
                        }
 
                        return "Date=" + dateArr[0] + "/" + months[dateArr[1] - 1] + year;
                }
 
 
    var shownIds = [];
    var mostRecentTime = 0; 
    function search(query){
       $.ajax({
          url: './api/hits' + query,
          headers: {
            'Accept': 'application/vnd.copapi.com+json; version=1',
          },
          dataType: 'json',
          success: function(data){
            var datarr = data.hits;
            datarr = $.grep(datarr, function(n, i){
                // console.log(n.id, shownIds, $.inArray(n.id, shownIds));
                if (($.inArray(n.id, shownIds)) >= 0){
                    return false;
                }
                else{
                    // console.log("hey")
                    shownIds.push(n.id);
                    return true;
                }
            });
            mostRecentTime = $(datarr).first().timestamp;
            drawer(datarr);
          }
        });
    }
    // Receives array of JSON reports

    function drawer(data){
 
        $(data).each(function(){
            var item = $(this)[0];
            // console.log(item);
            var html ='<div id="report" style="border: 5px solid black" class="container">';
            html += '<p>Report: '+ item.report+'</p>';
            html +='<p>Phone: '+ item.phone+'</p>';
            html +='<p>Name: '+ item.firstname + ' ' + item.lastname + '</p>';
            var link = '<a href="http://maps.google.com?q=' + item.lat + ',' + item.long + '\">Location</a>';
            html += link;
            console.log(html);
            // html +='<%=link_to "Map", map_path,:class => "btn btn-default", :method => :get %></div>';
            $("#feed-search").prepend(html);
        });
    }