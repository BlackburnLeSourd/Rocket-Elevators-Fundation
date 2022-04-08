// customer

$(function () {


    if ($("#customer").val() == "") {
        console.log("select#customer")
        $("#building option").remove();
        console.log("#building")
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        console.log("option-value-Building")
        $(row).appendTo("#building");
        console.log("End-First-Function")
    }

    $("#customer").change(function () {
        console.log("on change work")
        var id_value_string = $(this).val();
        console.log(id_value_string, "=========================-")
        if (id_value_string == "") {
            $("#building option").remove();
            console.log(id_value_string, "-----------------------------------------------")
            var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
            $(row).appendTo("#building");
            console.log("before else")
        } else {
            console.log("ajax")
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
                    console.log("success---------------------");
                    // Clear all options from building select
                    $("#building option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
                    $(row).appendTo("#building");
                    // Fill building select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                        $(row).appendTo("#building");
                        console.log("after Customer")
                    });
                }
            });
        }
    });

});

// building

// $(function () {

//     if ($("building").val() == "") {
//         $("#battery option").remove();
//         var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
//         $(row).appendTo("#battery");
//     }
//     $("#building").change(function () {
//         var id_value_string = $(this).val();
//         if (id_value_string == "") {
//             $("#battery option").remove();
//             var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
//             $(row).appendTo("#battery");
//         } else {
//             // Send the request and update battery dropdown
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_battery_by_building/' + id_value_string,
//                 timeout: 5000,
//                 error: function (XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function (data) {
//                     // Clear all options from battery select
//                     $("#battery option").remove();
//                     //put in a empty default line
//                     var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
//                     $(row).appendTo("#battery");
//                     // Fill battery select
//                     $.each(data, function (i, j) {
//                         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
//                         $(row).appendTo("select#");
//                     });
//                 }
//             });
//         }
//     });

// });

// //battery

// $(function () {

//     if ($("select#location").val() == "") {
//         $("select#course option").remove();
//         var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//         $(row).appendTo("select#course");
//     }
//     $("select#location").change(function () {
//         var id_value_string = $(this).val();
//         if (id_value_string == "") {
//             $("select#course option").remove();
//             var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//             $(row).appendTo("select#course");
//         } else {
//             // Send the request and update course dropdown
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_courses_by_location/' + id_value_string,
//                 timeout: 5000,
//                 error: function (XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function (data) {
//                     // Clear all options from course select
//                     $("select#course option").remove();
//                     //put in a empty default line
//                     var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//                     $(row).appendTo("select#course");
//                     // Fill course select
//                     $.each(data, function (i, j) {
//                         row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
//                         $(row).appendTo("select#course");
//                     });
//                 }
//             });
//         }
//     });

// });

// //Column

// $(function () {

//     if ($("select#location").val() == "") {
//         $("select#course option").remove();
//         var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//         $(row).appendTo("select#course");
//     }
//     $("select#location").change(function () {
//         var id_value_string = $(this).val();
//         if (id_value_string == "") {
//             $("select#course option").remove();
//             var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//             $(row).appendTo("select#course");
//         } else {
//             // Send the request and update course dropdown
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_courses_by_location/' + id_value_string,
//                 timeout: 5000,
//                 error: function (XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function (data) {
//                     // Clear all options from course select
//                     $("select#course option").remove();
//                     //put in a empty default line
//                     var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
//                     $(row).appendTo("select#course");
//                     // Fill course select
//                     $.each(data, function (i, j) {
//                         row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
//                         $(row).appendTo("select#course");
//                     });
//                 }
//             });
//         }
//     });

// });