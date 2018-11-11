<?php

  session_start();  

  $errors = array(); 

  $user="";

  $name="";
  $username="";
  $password="";
  $confirm_password="";
  $email="";
  $phone_no="";
  $house="";
  $street="";
  $area="";
  $police_station="";
  $post_office="";
  $district="";
  $division="";
  $zip="";
  
$db = mysqli_connect('localhost', 'root', '', 'boighor');

  if(isset($_POST['signup']))
  {
	  	$name=mysqli_real_escape_string($db,$_POST['name']);
		$username=mysqli_real_escape_string($db,$_POST['user_name']);
		$password=mysqli_real_escape_string($db,$_POST['password']);
		$confirm_password=mysqli_real_escape_string($db,$_POST['confirm_password']);

		$email=mysqli_real_escape_string($db,$_POST['email']);
		$phone_no=mysqli_real_escape_string($db,$_POST['phone_no']);

		$house=mysqli_real_escape_string($db,$_POST['house']);
		$street=mysqli_real_escape_string($db,$_POST['street']);
		$area=mysqli_real_escape_string($db,$_POST['area']);
		$police_station=mysqli_real_escape_string($db,$_POST['police_station']);
		$post_office=mysqli_real_escape_string($db,$_POST['post_office']);
		$district=mysqli_real_escape_string($db,$_POST['district']);
		$division=mysqli_real_escape_string($db,$_POST['division']);
		$zip=mysqli_real_escape_string($db,$_POST['zip']);

		if (empty($name)) { array_push($errors, "Name is required"); }
		if (empty($username)) { array_push($errors, "Username is required"); }
		if (empty($password)) { array_push($errors, "Password is required"); }
		
		if ($password != $confirm_password) 
		{
			array_push($errors, "The two passwords do not match");
		}

		if (empty($email)) { array_push($errors, "Email is required"); }
		if (empty($phone_no)) { array_push($errors, "Phone no is required"); }

		if (empty($house)) { array_push($errors, "House is required"); }
		if (empty($street)) { array_push($errors, "Street is required"); }
		if (empty($area)) { array_push($errors, "Area is required"); }
		if (empty($police_station)) { array_push($errors, "Police station is required"); }
		if (empty($post_office)) { array_push($errors, "Post office is required"); }
		if (empty($district)) { array_push($errors, "District is required"); }
		if (empty($division)) { array_push($errors, "Division is required"); }
		if (empty($zip)) { array_push($errors, "Zip is required"); }

		if (count($errors) == 0) 
		{
			$fpassword=md5($password);
			$q1="insert into user(name,user_name,password,email,phone,house,street,area,police_station,post_office,district,division,zip_code) values 
				('$name','$username','$fpassword','$email','$phone_no','$house','$street','$area','$police_station','$post_office','$district','$division','$zip')";
			mysqli_query($db, $q1);
			$_SESSION['success'] = "Your account has been created.";
			
			header('location: login_sign_up.php');
		}
	
	}
	//log in
	if(isset($_POST['login_user']))
	{
		$username=mysqli_real_escape_string($db,$_POST['user_name']);
		$password=mysqli_real_escape_string($db,$_POST['password']);
		if (empty($username)) { array_push($errors, "Username is required"); }
		if (empty($password)) { array_push($errors, "Password is required"); }
		if (count($errors) == 0) 
		{
			$password = md5($password);
			$query = "SELECT * FROM user WHERE user_name='$username' AND password='$password'";
			$results = mysqli_query($db, $query);

			if (mysqli_num_rows($results) == 1) 
			{
				$_SESSION['username'] = $username;
				header('location: home.php');
			}
			else 
			{
				array_push($errors, "Wrong username/password combination");
			}
		}
	}


	//logout
	if(isset($_GET['logout'])){
		session_destroy();
		unset($_SESSION['username']);
		header('location: home.php');
	}

	if(isset($_GET['user'])){
		$user=$_GET['user'];
		if(isset($_SESSION['username'])){
			header('location: home.php');
		}
		else
		{
			array_push($errors, "Wrong username/password combination");
			header('location: login_sign_up.php');
		}
		if(empty($user)){
			array_push($errors, "Login to Order");
			//header('location: login_sign_up.php');
		}

	}


  ?>