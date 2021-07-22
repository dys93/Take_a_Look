<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="${pageContext.request.contextPath}/">
      		메인 홈으로
      	</a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="height: 900px">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/admin" class="brand-link">
      <img src="${pageContext.request.contextPath}/resources/images/home/logoOrange.png" alt="Gaemyeo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">TakeALook</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
        </div>
        <div class="info" style="color:white; text-align: center">
          <span>${sessionScope.member.mNick}님</span>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin" class="nav-link">
              <i class="fas fa-home"></i>
              <p>&nbsp;관리자 메인</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/memberManagement" class="nav-link">
              <i class="fas fa-users-cog"></i>
              <p>&nbsp;회원 관리</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/donationManagement" class="nav-link">
              <i class="fas fa-donate"></i>
              <p>&nbsp;후원금 관리</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/mileageManagement" class="nav-link">
              <i class="fas fa-money-check-alt"></i>
              <p>&nbsp;마일리지 관리</p>
            </a>
          </li>
          <li class="nav-item"> 
            <a href="#" class="nav-link">
              <i class="fas fa-store"></i>
              <p>
				&nbsp;스토어 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/orderManagement" class="nav-link">
               	  <i class="fas fa-dolly-flatbed"></i>
                  <p>&nbsp;&nbsp;주문관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/productManagement" class="nav-link">
                  <i class="fas fa-gift"></i>
                  <p>&nbsp;&nbsp;상품관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/saleStatus" class="nav-link">
                  <i class="fas fa-chart-line"></i>
                  <p>&nbsp;&nbsp;매출현황</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-dog"></i>
              <p>
				&nbsp;펫시터 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/reservationManagement" class="nav-link">
                  <i class="far fa-calendar-alt"></i>
                  <p>&nbsp;&nbsp;예약관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/petsitManagement" class="nav-link">
                  <i class="fas fa-baby-carriage"></i>
                  <p>&nbsp;&nbsp;펫시터관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/petsitStatus" class="nav-link">
                  <i class="fas fa-chart-line"></i>
                  <p>&nbsp;&nbsp;매출현황</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
 </div>
 

 

 
