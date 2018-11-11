<?php
	include 'config.php';
	include('process.php');
		$fix_user_name="";
	/*
		1. mysql connection 
		2. embedding php within html
	*/
	
	
?>
<!DOCTYPE html>
<html>
<head>
	<title>Details</title>
	<link rel="stylesheet" type="text/css" href="css/css1.css">
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
				<li><a href="home.php"> Home </a></li>
				<li><a href="author.php"> Authors </a></li>
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
						$rowid=$row["id"];
						$final="home.php?id=".$rowid;
			?>
					<ul>
						<li><a href="<?php echo $final ?>"> <?php echo $row["name"]; ?></a>  </li>
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

			<?php 
				if(isset($_GET['bid'])){
					$bid=$_GET['bid'];
					$q="select b.name as Bname,a.name as Aname,c.name as Cname,p.name as Pname,image,price from book as b inner join author as a on a.id=author_id inner join publisher as p on p.id=publisher_id inner join catagory as c on c.id=catagory_id  where b.id=".$bid;
				}
				$query_result = mysqli_query($conn,$q) or die(mysql_error());
				if(mysqli_num_rows($query_result) > 0)
				{
					while ($row1 = mysqli_fetch_array($query_result))
					{
			
			?>
				<img src="image/<?php echo $row1['image'] ?>" width=" 200px " height="200px">
				
				<article>
					<?php echo "<h1> ".$row1['Bname']."</h1>" ?> 

					<?php echo "<h2>Author: ".$row1['Aname']." </h2>" ?><br><br><br> 	
					<?php echo "<h2>Publisher: ".$row1['Pname']. "</h2>" ?><br>
					<?php echo "<h2>Category: ".$row1['Cname']."</h2>" ?><br>
					<?php echo "<h2>Price: ".$row1['price']."</h2>" ?><br><br><br><br><br><br>
				<!--	<p>হিমু হুয়ায়ন আহমেদের লেখা বিখ্যাত চরিত্রের মধ্যে অন্যতম।</p>
				-->
					
				</article>

				<?php
					}
				}
				$ord="process.php?user=".$bid;
				include('errors.php');
			?>
					
					<h1 id="order_btn" ><a href="<?php echo $ord; ?>" >Order Now</a> </h1><br>
					
				
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