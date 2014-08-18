var siteloc = "http://localhost/Lab-Exam";
var scriptloc = "/scripts/"

 
function fetchrestOrder(ide)
{
  $.ajax({
      url: siteloc + scriptloc + "restOrder.py",
      data: {ide:ide,
				},
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
					  table = '<table border="1">';
					  table += "<tr> Items Ordered </tr> "
					  table += "<tr>";
					  table += "<td> Vegetable </td>";
					  table += "<td> Sea Food </td>";
					  table += "<td> Type of Rice </td>";
					  table += "<td> Beverages </td>";
					  table += "<td> Dessert </td>";
					  table += "</tr>";
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}
