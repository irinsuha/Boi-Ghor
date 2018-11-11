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
	<title>About us</title>
	<link rel="stylesheet" type="text/css" href="css/cssAbout.css">
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
				<li><a href="author.php"> Authors </a></li>
				<li><a href="publishers.php"> Publishers </a></li>
				<li><a href="" class="active"> About us </a></li>
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
						$rowid=$row["id"];
						$final="home.php?id=".$rowid;
			?>
					<ul>
						<li><a href="<?php echo $final ?>"> <?php echo $row["name"]; ?> </a> </li>
					<!--	<li><a href="C1">প্রবন্ধ</a></li>
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
				<div id="content_right_con">
					
				
					<h2>ABOUT US</h2>
					<h3>Ahsanullah University of Science and Technology.</h3>
					<img src="image/AUST_logo.jpg">
					<h3>Department of Computer Science and Engineering</h3>
					<h4>Software Development IV </h4>
				</div>
				
			</div>

		</dir>

	</div>
	<div>
		<footer>CSE 3100</footer>
	</div>
</body>
</html>
<?php
	include 'close.php';
?>