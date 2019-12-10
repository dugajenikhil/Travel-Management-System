<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            modal: true,
            autoOpen: false,
            title: "jQuery Dialog",
            width: 300,
            height: 150
        });
        $("#btnShow").click(function () {
            $('#dialog').dialog('open');
            var bus_id= $(this).attr("data-id");
        console.log(bus_id);
        var element = document.getElementById("myInput");
        element.value = bus_id;
        });
    });
</script>
<input type="button" data-id="40" id="btnShow" value="Show Popup" />
<div id="dialog" style="display: none" align = "center">
<form>
<input id="myInput" name="myInput" type="text" value="" />
<input type="submit">
</form>
<% String a="";
if (request.getParameter("myInput") != null) {
	a=request.getParameter("myInput"); 
}
%>
</div>
<center>

</center>

