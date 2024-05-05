<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="homepage.js"></script>
<script src="https://kit.fontawesome.com/371026b39a.js" crossorigin="anonymous"></script>
<style>
body {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  font-family: "Rubik", Helvetica, Arial, sans-serif;
  font-size: 14px;
  font-weight: normal;
  margin: 0;
  padding: 0;
  position: relative; 
}

.header {
  position: sticky;
  top: 0;
  background-image: linear-gradient(to bottom right, #FFBD6F, #FD8451);
  height: 70px;
  width: 100%;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  box-shadow: 0 0 10px rgba(253, 132, 81, 0.7), 0 0 10px rgba(255, 189, 111, 0.7);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding:20 20px;
  }
.box{
   height:30px;
   display:flex;
   cursor:pointer;
   padding:10px 20px;
   background: #fff;
   border-radius:30px;
   align-items:center;
   box-shadow: 0 10px 25px rgba(0,0,0,0.3);
   margin: 0 auto;
}

.box input{
width:400px;
outline:none;
border:none;
}
.logo{
  font-size:25px;
  font-family:'Courier New';
  margin-left:15px;;
}
.home{
   text-decoration:none;
}
.profile-dropdown {
  position: relative;
  width: fit-content;
}

.profile-dropdown {
  position: relative;
  width: fit-content;
}

.profile-dropdown-list {
  display: none;
  position: absolute;
  top: 40px;
  width: 150px;
  background-color: lightgray;
  border-radius: 10px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
  text-decoration: none;
  list-style: none;
  padding: 0;
}

.profile-dropdown-btn {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 500;
  border: 1px solid secondary;
  border-radius: 50px;
  cursor: pointer;
  width: 100px;
  transition: box-shadow 0.2s, background-color 0.2s;
}

.profile-dropdown-btn:hover {
  height: 40px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}
.profile-dropdown-btn:active {
  height: 40px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

.profile-dropdown-btn span {
  margin: 0 0.5rem;
  margin-right: 10px;
}

.profile-dropdown:hover .profile-dropdown-list {
  display: block;
}

.profile-dropdown-list-item {
  padding: 0.5rem 1rem;
}

.profile-dropdown-list-item a {
  display: flex;
  align-items: center;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 500;
  color: black;
}

.profile-dropdown-list-item a i {
  margin-right: 0.5rem;
  font-size: 1rem;
  width: 2rem;
  height: 2rem;
  background-color: white;
  color: black;
  line-height: 2rem;
  text-align: center;
  border-radius: 50%;
}

.profile-dropdown-list-item:hover {
  padding-left: 1.5rem;
  background-color: white;
  border-radius:10px;
}
.profile-img{
  font-size:20px;
}
</style>
<meta charset="ISO-8859-1">
<title>hand-carved</title>
</head>
<body>
    <form action="profile" method="post">
        <div class="header">
            <div class="logo">
                <a href="homepage.jsp" style="color:black;" class="home">
                    <strong>Hand-Carved</strong>
                </a>
            </div>
            <div class="box">
                <input type="text" name="search" id="search" placeholder="Search...">
                <a href="#">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>
            </div>
            <div class="profile-dropdown">
                <div class="profile-dropdown-btn">
                    <div class="profile-img">
                        <i class="fa-sharp fa-solid fa-circle-user"></i>
                    </div>
                    <span style="margin-left: -5px;">${name}
                          <c:set var="name" value="${sessionScope.name}" />
                          <c:set var="lastname" value="${sessionScope.lastname}" />
                          <c:set var="email" value="${sessionScope.email}" />
                          <c:set var="phone" value="${sessionScope.phone}" />
                          <c:set var="date" value="${sessionScope.date}" />
                        <i class="fa-solid fa-caret-down"></i>
                    </span>
                </div>
                <ul class="profile-dropdown-list">
                    <li class="profile-dropdown-list-item">
                        <a href="profile.jsp">
                            <i class="fa-regular fa-user"></i>
                            Profile
                        </a>
                    </li>
                    <li class="profile-dropdown-list-item">
                        <a href="about.jsp">
                            <i class="fa-sharp fa-regular fa-address-card"></i>
                            About
                        </a>
                    </li>
                    <hr />
                    <li class="profile-dropdown-list-item">
                        <a href="logout">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            Log out
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
    </form>
</body>

</html>