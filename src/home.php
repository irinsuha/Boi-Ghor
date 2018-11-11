<?php
	include 'config.php';
	include('process.php');
		$fix_user_name="";
	
	
?>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
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
				<li><a href="#1" class="active"> Home </a></li>
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
						//$rowid=$row["id"];
						//$final="home.php?id=".$rowid;
			?>
					<ul>
						<li><a href="home.php?id=<?php echo $row['id']; ?>"> <?php echo $row["name"]; ?></a>  </li>
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

		</dir>
		<div id="content_right">
		<?php 
			$string_catagory="Recently Added Book";
			$varid=0;
			$q = "SELECT b.id as ID ,b.name as Bname,image,a.name as Aname,p.name as Pname FROM book as b inner join author as a on a.id=author_id inner join publisher as p on p.id=publisher_id order by(ID) desc limit 8";
			
		if(isset($_GET['id'])){
				$id=$_GET['id'];
				$q="SELECT b.id as ID ,b.name as Bname,image,a.name as Aname,p.name as Pname FROM book as b inner join author as a on a.id=author_id inner join publisher as p on p.id=publisher_id where b.catagory_id=".$id;
				$query = " SELECT name FROM catagory where id=".$id;
				$players_query_result = mysqli_query($conn,$query) or die(mysql_error());
				if(mysqli_num_rows($players_query_result) > 0){
					while ($row = mysqli_fetch_array($players_query_result))
					{
						
				 	$string_catagory= $row['name'];
				 	//echo $string_catagory;
					}
				}
				else{
					$string_catagory="Recently Added Book";
				}

				

		}
		else if(isset($_GET['au'])){
				$auid=$_GET['au'];
				$q="SELECT b.id as ID ,b.name as Bname,image,a.name as Aname,p.name as Pname FROM book as b inner join author as a on a.id=author_id inner join publisher as p on p.id=publisher_id where author_id=".$auid." or trans_author_id=".$auid;

				$query = " SELECT name FROM author where id=".$auid;
				$players_query_result = mysqli_query($conn,$query) or die(mysql_error());
				if(mysqli_num_rows($players_query_result) > 0){
					while ($row = mysqli_fetch_array($players_query_result))
					{
						
				 	$string_catagory= $row['name'];
				 	//echo $string_catagory;
					}
				}
				else{
					$string_catagory="Recently Added Book";
				}
		}
		else if(isset($_GET['pu'])){
				$puid=$_GET['pu'];
				$q="SELECT b.id as ID ,b.name as Bname,image,a.name as Aname,p.name as Pname FROM book as b inner join author as a on a.id=author_id inner join publisher as p on p.id=publisher_id where publisher_id=".$puid;

				$query = " SELECT name FROM publisher where id=".$puid;
				$players_query_result = mysqli_query($conn,$query) or die(mysql_error());
				if(mysqli_num_rows($players_query_result) > 0){
					while ($row = mysqli_fetch_array($players_query_result))
					{
						
				 	$string_catagory= $row['name'];
				 	//echo $string_catagory;
					}
				}
				else{
					$string_catagory="Recently Added Book";
				}
		}

		
			echo "<h3>".$string_catagory."</h3>";
				$query_result = mysqli_query($conn,$q) or die(mysql_error());
				if(mysqli_num_rows($query_result) > 0)
				{
					while ($row1 = mysqli_fetch_array($query_result))
					{
				
				
			?>
			<ul><a href="content_details.php?bid=<?php echo $row1['ID'] ?>">
				<li><img src="image/<?php echo $row1['image'] ?>" ></li>	
				<li> <?php echo "<h3>Name : ".$row1['Bname']. " </h3>" ?></li>
				<li><?php echo "<h3>Author : ".$row1['Aname']." </h3>" ?></li>
				<li><?php echo "<h3>Publisher : ".$row1['Pname']." </h3>" ?></li>
				</a>
			</ul>
			<?php
					}
				}
			?>
			<!--<ul><a href="content_details.html">
				<li><img src="image/Travels of ibne batuta.jpg" ></li>	
				<li><h3>Name : ট্রাভেলস অব ইবনে বতুতা</h3></li>
				<li><h3>Author : ইফতেখার আমিন , এইচ. এ. আর. গিব </h3></li>
				<li><h3>Publisher :  ঐতিহ্য</h3></li>
				</a>
			</ul>
			<ul><a href="content_details.html">
				<li><img src="image/suhaner_shopno.jpg" ></li>	
				<li><h3>Name : সুহানের সপ্ন</h3></li>
				<li><h3>Author : মুহম্মদ জাফর ইকবাল</h3></li>
				<li><h3>Publisher : সময় প্রকাশন</h3></li>
				</a>
			</ul>
			<ul><a href="content_details.html">
				<li><img src="image/satkahon.jpg" ></li>	
				<li><h3>Name : সাতকাহন (অখণ্ড)</h3></li>
				<li><h3>Author : সমরেশ মজুমদার</h3></li>
				<li><h3>Publisher : আনন্দ পাবলিশার্স (ভারত)</h3></li>
				</a>
			</ul>
			
			<ul><a href="content_details.html">
				<li><img src="image/himu.jpg" ></li>	
				<li><h3>Name : হিমু</h3></li>
				<li><h3>Author : হুমায়ন আহমেদ</h3></li>
				<li><h3>Publisher : অন্য প্রকাশ</h3></li>
				</a>
			</ul>
			<ul><a href="content_details.html">
				<li><img src="image/Da-Vinci-Code-By-Dan-Brown.jpg" ></li>	
				<li><h3>Name : দ্য দা ভিঞ্চি কোড</h3></li>
				<li><h3>Author : ড্যান ব্রাউন , মোহাম্মদ নাজিম উদ্দিন (Translator)</h3></li>
				<li><h3>Publisher : Onno Prokash</h3></li>
				</a>
			</ul>
			<ul><a href="content_details.html">
				<li><img src="image/sheser_kobita.jpg" ></li>	
				<li><h3>Name : শেষের কবিতা</h3></li>
				<li><h3>Author : রবীন্দ্রনাথ ঠাকুর</h3></li>
				<li><h3>Publisher : বিশ্বসাহিত্য ভবন</h3></li>
				</a>
			</ul>
			<ul><a href="content_details.html">
				<li><img src="image/the_power_of_positive_thinking.jpg" ></li>	
				<li><h3>Name : দ্য পাওয়ার অব্‌ পজিটিভ থিংকিং</h3></li>
				<li><h3>Author : ড. নরম্যান ভিনসেন্ট পিল , লিউনার্ড স্বপন গোমেজ (Translator)</h3></li>
				<li><h3>Publisher : মুক্তদেশ প্রকাশন</h3></li>

			</ul> -->
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