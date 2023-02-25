<?php
session_start();
$_SESSION["section"]="index.php";
$_SESSION["category"]="index.php";
if(!isset($_SESSION["username"])){
  $_SESSION["username"] = "GUEST";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/users.js"></script>
    <script src="js/vue.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/selfstyle.css"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">  
    <title>NoneQ Stores</title>
</head>
<body>
    <div id="app">
    <main>
    <nav class="navbar navbar-expand-md navbar-light sticky-top border-bottom bg-dark">
            <div class="container-fluid">
                <div></div>
                <a class="navbar-brand" href="index.php" style="text-decoration: none !important;">
                  <!-- logo -->
                    <img src="image/Icon.png" style="max-height:7.5vh; width: auto;">
                </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-0">
                  <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle text-light" href="category.php" id="navbarDropdown">
                      หนังสือ
                    </a>
                    <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item text-light" href="g-fantasy.php">แฟนตาซี(Fantasy)</a></li>
                      <li><a class="dropdown-item text-light" href="g-sci-fi.php">ไซไฟ(Sci-fi)</a></li>
                      <li><a class="dropdown-item text-light" href="g-romance.php">รัก/โรแมนติก(Romance)</a></li>
                      <li><a class="dropdown-item text-light" href="g-adventure.php">ผจญภัย/บู๊แอกชัน(Adventure)</a></li>
                      <li><a class="dropdown-item text-light" href="g-history.php">อิงประวัติศาสตร์(History)</a></li>
                      <li><a class="dropdown-item text-light" href="g-horror-mystery.php">ลึกลับ/เขย่าขวัญ/สืบสวนสอบสวน(Mystery/Horror)</a></li>
                      <li><a class="dropdown-item text-light" href="g-light-novel.php">ไลท์โนเวล(Light novel)</a></li>
                      <li><a class="dropdown-item text-light" href="g-wu-xia.php">กำลังภายใน(Wu Xia)</a></li>
                    </ul>
                  </li>
                  <a class="nav-link text-light" href="g-popular.php" >
                      ยอดนิยม
                  </a>
                </ul>
                <form class="d-flex" method="POST" action="search_check.php">
                  <input class="form-control me-2" name="search" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-light" type="submit">Search</button>
                </form>
                <a class="bi bi-person text-light mx-3" href="profile.php" style="font-size: 2rem;"> </a>
                <?php
                echo "<div class='fw-bold fs-4 mx-1 text-white'>";
                echo $_SESSION["username"];
                echo "</div>";
                ?>
                <a class="bi bi-cart text-light mx-3" href="cart.php" style="font-size: 2rem;"> </a>
              </div>
            </div>
        </nav>
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <div class="carousel-indicators">
              <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
            </div>
            
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="image/wallpaper/LUCKPIM.png" alt="" class="d-block" style="width:100%;height:90vh">
              </div>
              <div class="carousel-item">
                <img src="image/wallpaper/SIAMINTER.png" alt="" class="d-block" style="width:100%;height:90vh">
              </div>
              <div class="carousel-item">
                <img src="image/wallpaper/DEX.png" alt="" class="d-block" style="width:100%;height:90vh">
              </div>
              <div class="carousel-item">
                <img src="image/wallpaper/DANGOMANGA.png" alt="" class="d-block" style="width:100%;height:90vh">
              </div>
            </div>
    
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
    </main>
    <footer style="border-top: 1.5px solid rgba(0, 0, 0, 0.1);">
    <div class="container-fluid">
      <div class="row p-3">
        <div class="col-md-5 col-12 p-3 h3">
              <div>
                <a class="navbar-brand" href="index.php" style="text-decoration: none !important;">
                  <img src="image/Icon.png" style="max-height:7vh; width: auto;"> Unibook
                </a>
              </div>
          <div class="h5" style="margin-top: 15px">
            <a href="https://www.facebook.com/" class="m-2 link-dark" target="_blank" style="text-decoration: none;">
              <i class="bi bi-facebook"> Facebook</i>
            </a>
            <a href="https://twitter.com/" class="m-2 link-dark" target="_blank" style="text-decoration: none;">
              <i class="bi bi-twitter"> Twitter</i>
            </a>
            <a href="https://www.instagram.com/" class="m-2 link-dark" target="_blank" style="text-decoration: none;">
              <i class="bi bi-instagram"> Instagram</i>
            </a>
            <a href="https://www.youtube.com/" class="m-2 link-dark" target="_blank" style="text-decoration: none;">
              <i class="bi bi-youtube"> Youtube</i>
            </a>
          </div>
        </div>
        <div class="col-md-4 col-12 p-3">
        <b>จัดทำโดย</b> <br>
        วชิรพล กลิ่นเกษร		64070096 <br>
        </div>
        <div class="col-md-3 col-12 p-3">
                <a href="https://www.it.kmitl.ac.th/th/" target="_blank" style="text-decoration: none;">
                <img src="image/ITKMITL.png" class="w-75">
                </a>
                <div>
                เว็บไซต์นี้เป็นส่วนหนึ่งของวิชา Web Technology<br> 
                06016312 ภาคการเรียนที่ 1 ปีการศึกษา 2565
                </div>
        </div>
      </div>
      </div>
      <div class="text-center p-2 bg-dark text-white" style="">© 2022 Copyright:
          <a class="text-reset fw-bold" href="index.php" style="text-decoration: none;">Unibook.com</a>
      </div>
    </footer>
    <div>
</body>
</html>