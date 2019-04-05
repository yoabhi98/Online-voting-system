<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



		<link href="Registration1.css" rel="stylesheet">

	    <link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap-grid.css">
		<title>Admin</title>
	<script type="text/javascript">

	function validateForm()
	{  
	    var dob = document.getElementById("dateofbirth").value;
	    var now = new Date();
	    var birthdate = dob.split("/");
	    var born = new Date(dob[2], dob[0], dob[1] * 1 - 1);
	    var age = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
	    if (age<18)
	    {
	        alert("You need to be 18 years of age and older");
	        return false;
	    }
	return true;
	}

	</script>
</head>
<body>
<div class="container">

			<div class="row main">

				<div class="main-login main-center">

				<h5> <span style="color:red">ELECTION COMMISSION OF INDIA</span></h5>
					<form class="" onsubmit="return validateForm()" method="post" action="hello">
						
						<div class="form-group">
						<input type="hidden" name="PageName" value="Registers"/>
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
							
									<input type="text" class="form-control" name="uname" placeholder="Enter your Name" required = "required"/>
								
							</div>
						</div>
							<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Father Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="fname" required = "required" placeholder="Enter your Name"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="mail" placeholder="uemail@gmail.com"/>
								</div>
							</div>
						</div>
                          <div class="form-group">
							<label for="gender" class="cols-sm-2 control-label">Gender</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="radio" value="M" name="ugender"/ required = "required">Male
                                     <input type="radio" value="F" name="ugender" required = "required"/>Female
							</div>
						</div>
				
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">DOB</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" id="dateofbirth" class="form-control" name="udob" required = "required"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Aadhar</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="number" class="form-control"  required = "required" pattern="[0-9]{12}" name="aadhar"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="Mobile" class="cols-sm-2 control-label">Mobile</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="number" class="form-control" pattern="[0-9]{10}" required = "required" placeholder="enter your contact no." name="ucontact"/>
								</div>
							</div>
						</div>
						  <div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<select name="Region">
                                      <option value="Mumbai">Maharashtra</option>
                                      <option value="Delhi" selected="selected">Delhi</option>
                                        <option value="Agra">Haryana</option>
                                        <option value="UP">Uttar Pradesh</option>
                                            </select>
								</div>
							</div>
						</div>
	
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" required = "required" class="form-control" name="password" placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						<div class="form-group ">
							<input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Register">
						</div>
						
					</form>
				</div>
			</div>
		</div>
</body>
</html>