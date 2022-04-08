// customer

$(function () {

    if ($("#customer").val() == "") {
        $("#building option").remove();
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("#building");

    }

    $("#customer").change(function () {
        // console.log("on change work------building_by_customer")
        var id_value_string = $(this).val();
        // console.log(id_value_string, "=========================-")
        if (id_value_string == "") {
            $("#building option").remove();
            // console.log(id_value_string, "building_remove-----------------------------------------------")
            var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
            $(row).appendTo("#building");
        } else {
            // console.log("ajax")
            // Send the request and update building dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_building_by_customer/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // console.log("success---------------------");
                    // Clear all options from building select
                    $("#building option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
                    $(row).appendTo("#building");
                    // Fill building select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                        $(row).appendTo("#building");
                        // console.log("after Customer")
                    });
                }
            });
        }
    });

});

// building

$(function () {

    if ($("#building").val() == "") {
        $("#battery option").remove();
        var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        $(row).appendTo("#battery");

    }

    $("#building").change(function () {
        // console.log("on change work------battery_by_building")
        var id_value_string = $(this).val();
        // console.log(id_value_string, "=========================-")
        if (id_value_string == "") {
            $("#battery option").remove();
            // console.log(id_value_string, "battery_remove-----------------------------------------------")
            var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
            $(row).appendTo("#battery");
        } else {
            // console.log("ajax")
            // Send the request and update battery dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_battery_by_building/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // console.log("success---------------------");
                    // Clear all options from battery select
                    $("#battery option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
                    $(row).appendTo("#battery");
                    // Fill battery select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                        $(row).appendTo("#battery");
                        // console.log("after Building")
                    });
                }
            });
        }
    });

});

// //battery

$(function () {

    if ($("#battery").val() == "") {
        $("#column option").remove();
        var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        $(row).appendTo("#column");

    }

    $("#battery").change(function () {
        // console.log("on change work------column_by_battery")
        var id_value_string = $(this).val();
        // console.log(id_value_string, "=========================-")
        if (id_value_string == "") {
            $("#column option").remove();
            // console.log(id_value_string, "column_remove-----------------------------------------------")
            var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
            $(row).appendTo("#column");
        } else {
            // console.log("ajax")
            // Send the request and update column dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_column_by_battery/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // console.log("success---------------------");
                    // Clear all options from column select
                    $("#column option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
                    $(row).appendTo("#column");
                    // Fill column select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                        $(row).appendTo("#column");
                        // console.log("after Battery")
                    });
                }
            });
        }
    });

});

// //Column

$(function () {

    if ($("#column").val() == "") {
        $("#elevator option").remove();
        var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(row).appendTo("#elevator");
    }
    $("#column").change(function () {
        // console.log("on change work------elevator_by_column")
        var id_value_string = $(this).val();
        // console.log(id_value_string, "=========================-")
        if (id_value_string == "") {
            $("#elevator option").remove();
            // console.log(id_value_string, "elevator_remove-----------------------------------------------")
            var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
            $(row).appendTo("#elevator");
        } else {
            // console.log("ajax")
            // Send the request and update elevator dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_elevator_by_column/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // console.log("success---------------------");
                    // Clear all options from elevator select
                    $("#elevator option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
                    $(row).appendTo("#elevator");
                    // Fill elevator select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                        $(row).appendTo("#elevator");
                        // console.log("after column")
                    });
                }
            });
        }
    });

});