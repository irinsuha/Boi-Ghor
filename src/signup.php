<?php
  include 'config.php';
  include('process.php');
    $fix_user_name="";
  /*
    1. mysql connection 
    2. embedding php within html
  */
  
  
?><!DOCTYPE html>
<html>
<head>
	<title>Login/Sign up</title>
	<link rel="stylesheet" type="text/css" href="css/css2.css">
</head>
<body>
	<div id="page">
  <?php 
    if (isset($_SESSION['username'])) {
      $fix_user_name=$_SESSION['username'];
      # code...
    }
  ?>
		<header>বই ঘর</header>
		<div id="menu">
			<ul>
				<li><a href="home.php" > Home </a></li>
        <li><a href="author.php" > Authors </a></li>
        <li><a href="publishers.php"> Publishers </a></li>
				<li><a href="about_us.php"> About us </a></li>
        <?php if(empty($fix_user_name))
          { 
        ?>
          <li ><a href="login_sign_up.php" style="float: right;"> Log In </a></li>
        <?php 
          } 
          else
          {
        ?>
          <li ><a href="home.php?logout='1'"  style="float: right;"> Log Out :<?php echo $fix_user_name; ?></a></li>
        <?php 
          }
        ?>
			</ul>
		</div>

		<div id="content">
			<div id="content_left">
				<div class="content_left_selection">
					
					<h1>Catagories</h1>
			<?php 
        $query = " SELECT * FROM catagory";
        $players_query_result = mysqli_query($conn,$query) or die(mysql_error());
        if(mysqli_num_rows($players_query_result) > 0)
        {
          while ($row = mysqli_fetch_array($players_query_result))
          {
            //$rowid=$row["id"];
            //$final="home.php?id=".$rowid;
      ?>
          <ul>
           <li><a href="home.php?id=<?php echo $row['id']; ?>"> <?php echo $row["name"]; ?></a> </li> 
          <!--  <li><a href="C1">প্রবন্ধ</a></li>
            <li><a href="C2">কবিতা</a></li>
            <li><a href="C3">উপন্যাস</a></li>
            <li><a href="C4">অনুবাদ</a></li>
            <li><a href="C5">ইতিহাস ও ঐতিহ্য</a></li>
            <li><a href="C6">মুক্তিযুদ্ধ</a></li>
            <li><a href="C7">ব্যঙ্গ ও রম্যরচনা</a></li>
            <li><a href="C8">সায়েন্স ফিকশন</a></li>
            <li><a href="C9">ভ্রমণ ও প্রবাস</a></li>
            <li><a href="C10">ব্যবসা, বিনিয়োগ ও অর্থনীতি</a></li>
          -->
          </ul>
      <?php
          }
        }
      ?>
				</div>
			</div>
			<div id="content_right">        

          		<form action="signup.php" method="post">
          			
                

              		<h2>Create a new account:</h2>
                  <?php include('errors.php'); ?>
             		<fieldset>
                		<h2> Your information : </h2>
                    <label>Name :</label>
                		<input type="text" name="name" value="<?php echo $name; ?>">
                    <label>Username :</label>
                		<input type="text" name="user_name" value="<?php echo $username; ?>"><br>
                    <label>Password :</label>
                		<input type="password" name="password" value="">
                    <label>Confirm Password :</label>
                		<input type="password" name="confirm_password" value=""><br> 
                    <label>Email Address :</label>
                		<input type="email" name="email" value="<?php echo $email; ?>">
                    <label>Phone No :</label>
                		<input type="text" name="phone_no" value="<?php echo $phone_no; ?>"><br>
                		



        			</fieldset>

              		<fieldset>

                 		<h2>Address:</h2> 
                    <label>House :</label>
                 		<input type="text" name="house" value="<?php echo $house; ?>" >
                    <label>Street :</label>
                 		<input type="text" name="street" value="<?php echo $street; ?>" ><br>
                    <label>Area :</label>
                 		<input type="text" name="area" value="<?php echo $area; ?>" >
                    <label>Police Station :</label>
                 		<input type="text" name="police_station" value="<?php echo $police_station; ?>" ><br>
                    <label>Post Office :</label>
                 		<input type="text" name="post_office" value="<?php echo $post_office; ?>" >
                    <label>District :</label>
                 		<input type="text" name="district" value="<?php echo $district; ?>" ><br>
                    <label>Division :</label>
                		<input type="text" name="division" value="<?php echo $division; ?>" >      
                    <label>Zip code :</label>        		
                		<input type="text" name="zip" value="<?php echo $zip; ?>" ><br>
               


              		</fieldset>
              		<fieldset>
                		<br>
                		<!-- <button formmethod="post" formaction="home.php" type="submit" name="signup">Submit</button>
                    -->
                    <button   type="submit" name="signup">Submit</button> 


              		</fieldset>

          

           			<br>
           			<br><br><br><br><br>
         

         		</form>

			
			</div>

		</div>

	</div>
	<div>
		<footer>CSE 3100</footer>
	</div>
</body>
</html>
<?php
  include 'close.php';
?>