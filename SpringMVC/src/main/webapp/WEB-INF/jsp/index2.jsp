<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <style>
        #result {
            background-color: black;
            color: white;
        }
    </style>
</head>

<body>
    <form>
        <label>UserName</label>
        <input type="text" id="name" />
        <label>Password</label>
        <input type="password" id="pass" />
        <br>
        <input type="button" onclick="ajax()" value="Submit"/>
    </form>
    <div id="result">

    </div>
    <script>
        var user = {};
        function ajax() {
            if (document.getElementById("name").value == "" || document.getElementById("pass").value == "") {
                alert("All Fields are mandatory")
                return;
            }
            else {
                user.username = document.getElementById("name").value;
                user.password = document.getElementById("pass").value;
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify(user),
                    crossDomain: true,
                    dataType: 'json',
                    contentType: 'application/json',
                    url: "http://localhost:8085/login",
                    success: function (result) {
                        var obj = {};
                        obj = result;
                        alert("Authentication Successful");
                        $.ajax({
                            type: 'GET',
                            crossDomain: true,
                            dataType: 'json',
                            contentType: 'application/json',
                            url: "http://localhost:8085/userdetails",
                            success: function (result) {
                                var obj = {};
                                obj = result;
                                alert(result)
                                $("#result").html(obj);
                            },
                            error: function (err) {
                            	
                            	 $("#result").html(err.responseText);
                            }

                        });
                        
                    },
                    error: function (err) {
                        console.log(err);
                    }

                });

            }
        }
    </script>
</body>

</html>