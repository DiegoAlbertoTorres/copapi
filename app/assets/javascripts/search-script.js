function buttonClicked() {
 
        var type = document.getElementById("type").value;
        var longitud = document.getElementById("longitud").value;
        var latitud = document.getElementById("latitud").value;
        var minDate = document.getElementById("minDate").value;
        var maxDate = document.getElementById("maxDate").value;

        var query = "localhost:3000?";
        var first = true;

        if (type != "") {
            if (first) {
                        query += "type=" + type;
                        first = false;
             } else {
                        query += "&type=" + type;
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