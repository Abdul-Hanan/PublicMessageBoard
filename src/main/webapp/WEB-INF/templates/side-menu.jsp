<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar icon-colored menupos-static">
    <div class="navbar-wrapper">
        <div class="navbar-brand header-logo">
            <a href="#" class="b-brand">
              <%--   <img src="${contextPath}/assets/images/logo-half.png" height="50px" width="70px"> --%>
                <span class="b-title" style="margin-top: 7px;font-size: 22px">Raseel</span>
            </a>
            <a class="mobile-menu" id="mobile-collapse" onclick="mobileCollapse();"  href="#!"><span></span></a>
        </div>
        <div class="navbar-content scroll-div">
            <ul class="nav pcoded-inner-navbar">
                <li class="nav-item pcoded-menu-caption">
                    <label>Navigation</label>
                </li>
                <sec:authorize access="hasAuthority('superadmin')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/adminShipments" id="superadmin" onclick="savesidebar('adminShipments');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('admin')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/adminShipments"  id="adminShipments" onclick="savesidebar('adminShipments');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('operations')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/shipments" id="shipments" onclick="savesidebar('shipments');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('accountant')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/welcomeAccountant" id="welcomeAccountant" onclick="savesidebar('welcomeAccountant');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('customer')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/shipments" id="shipments" onclick="savesidebar('shipments');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
               <sec:authorize access="hasAuthority('customeruser')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/shipments" id="shipments" onclick="savesidebar('shipments');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Shipments</span></a>
                    </li>
                </sec:authorize>
                
                 <sec:authorize access="hasAuthority('developer')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item ">
                        <a href="${contextPath}/welcomeDeveloper" id="welcomeDeveloper" onclick="savesidebar('welcomeDeveloper');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">My Apps</span></a>
                    </li>
                </sec:authorize>
                
                <!-- This Section for Quick Stats different for each role  -->
        
                <sec:authorize access="hasAuthority('superadmin')">
                   <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeSuperAdmin" id="welcomeSuperAdmin" onclick="savesidebar('welcomeSuperAdmin');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize>
              <%--   <sec:authorize access="hasAuthority('admin')">
                     <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeAdminDashboard" id="welcomeAdminDashboard" onclick="savesidebar('welcomeAdminDashboard');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize> --%>
                <sec:authorize access="hasAuthority('operations')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeOperations" id="welcomeOperations" onclick="savesidebar('welcomeOperations');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('accountant')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeAccountant" id="welcomeAccountant" onclick="savesidebar('welcomeAccountant');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('customer')">
                     <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeCustomer" id="welcomeCustomer" onclick="savesidebar('welcomeCustomer');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize>
              <%--  <sec:authorize access="hasAuthority('customeruser')">
                    <li data-username="dashboard Default Ecommerce CRM Analytics Crypto Project" class="nav-item">
                        <a href="${contextPath}/welcomeUser" id="welcomeUser" onclick="savesidebar('welcomeUser');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Quick Statistics</span></a>
                    </li>
                </sec:authorize> --%>
                
                <!--  Quick Stats Section end -->            
 

                <sec:authorize access="hasAuthority('create-custom-user')">
                    <li data-username="createCustomUser Create Custom User" class="nav-item">
                        <a href="${contextPath}/createCustomUser" id="createCustomUser" onclick="savesidebar('createCustomUser');" class="nav-link"><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span class="pcoded-mtext">Custom Users</span></a>
                    </li>
                </sec:authorize>


                <sec:authorize access="hasAnyAuthority('admin','customer')">
                    <li data-username="Vertical Horizontal Box Layout RTL fixed static Collapse menu color icon dark" class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-users"></i></span><span class="pcoded-mtext">Raseel Users</span></a>
                        <ul class="pcoded-submenu">
                        <%--             <sec:authorize access="hasAuthority('view-crowd')">
                                <li class=""><a href="${contextPath}/crowds" class="">Crowds</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('view-transportationpartner')">
                                <li class=""><a href="${contextPath}/transportationpartners" class="">Transportation Partner</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('view-stationpartner')">
                                <li class=""><a href="${contextPath}/stationpartners" class="">Station Partners</a></li>
                            </sec:authorize> --%>
                              <sec:authorize access="hasAuthority('view-customer')">
                                <li class=""><a href="${contextPath}/customers" id="customers" onclick="savesidebar('customers');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Customers</span></a></li>
                            </sec:authorize>
                            
                         
                              <sec:authorize access="hasAuthority('view-driver')">
                                <li class=""><a href="${contextPath}/drivers" id="drivers" onclick="savesidebar('drivers');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Drivers</span></a></li>
                            </sec:authorize>
                          <%--   <sec:authorize access="hasAnyAuthority('view-driverSupervisor','admin')">
                                <li class=""><a href="${contextPath}/driverSupervisors"  id="driverSupervisors" onclick="savesidebar('driverSupervisors');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Driver Supervisors</span></a></li>
                            </sec:authorize> --%>
                          	<sec:authorize access="hasAnyAuthority('view-admins','admin')">
                             <!--${contextPath}/adminUsers--> 
                                <li class=""><a href="${contextPath}/admins" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Admin Users</span></a></li>
                            </sec:authorize>
                
                            <sec:authorize access="hasAnyAuthority('view-operators','admin')">
                                <li class=""><a href="${contextPath}/operators" id="operators" onclick="savesidebar('operators');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Operators</span></a></li>
                            </sec:authorize>
                            
                            <sec:authorize access="hasAnyAuthority('view-accountant','admin')">
                            <!--accountants-->                                
							<li class=""><a href="${contextPath}/accountants"  id="accountants" onclick="savesidebar('accountants');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Accountants</span></a></li>
                            </sec:authorize>
                            
                            <sec:authorize access="hasAuthority('view-receivers')">
                                <li class=""><a href="${contextPath}/receivers" id="receivers" onclick="savesidebar('receivers');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Receivers</span></a></li>
                            </sec:authorize>   
                            
                             <sec:authorize access="hasAuthority('view-developers')">
                                <li class=""><a href="${contextPath}/developers" id="developers" onclick="savesidebar('developers');" class=""><span class="pcoded-micon"><i class="feather icon-user-plus"></i></span><span>Developers</span></a></li>
                            </sec:authorize>                   
 							<%-- <sec:authorize access="hasAuthority('view-device')">
                                <li class=""><a href="${contextPath}/devices" class=""><span class="pcoded-micon"><i class="feather icon-smartphone"></i></span><span>Devices</span></a></li>
                            </sec:authorize> --%>

                        </ul>
                    </li>

                </sec:authorize>
                 <%-- <sec:authorize access="hasAnyAuthority('admin,view-driverCashStats','driverAccounts')">
                
                  <li data-username="statsDriverUser Statistics Driver User" class="nav-item">
                        <a href="${contextPath}/driverAccounts" id="driverCashStats" onclick="savesidebar('driverAccounts');" class="nav-link">
                        <span class="pcoded-micon">
                        <i class="feather icon-briefcase"></i>
                        </span><span class="pcoded-mtext">Driver Cash Account</span>
                        </a>
                    </li>
                    
                      
                    </sec:authorize> --%>
                    
                     <sec:authorize access="hasAuthority('view-serviceCharge')">
                                 <li data-username="statsDriverUser Statistics Driver User" class="nav-item">
                                  <a href="${contextPath}/serviceCharges" id="serviceCharges" onclick="savesidebar('serviceCharges');"  class="nav-link">
			                        <span class="pcoded-micon">
			                        
			                        <i class="feather icon-credit-card"></i>
			                        </span><span class="pcoded-mtext">Service Fee</span>
			                        </a>
                            </sec:authorize>
              
                <sec:authorize access="hasAnyAuthority('admin','customer','customeruser')">
                    <li data-username="Vertical Horizontal Box Layout RTL fixed static Collapse menu color icon dark" class="nav-item pcoded-hasmenu" style="background-color: #3f4d67">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Locations</span></a>
                        <ul class="pcoded-submenu">
                         <sec:authorize access="hasAuthority('view-area')">
                                <li class=""><a href="${contextPath}/areas" id="areas" onclick="savesidebar('areas');" class=""><span class="pcoded-micon"><i class="feather icon-map-pin"></i></span><span>Areas</span></a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('view-zone')">
                                <li class=""><a href="${contextPath}/zones" id="zones" onclick="savesidebar('zones');" class=""><span class="pcoded-micon"><i class="feather icon-map-pin"></i></span><span>Zones</span></a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('view-city')">
                                <li class=""><a href="${contextPath}/cities" id="cities" onclick="savesidebar('cities');" class=""><span class="pcoded-micon"><i class="feather icon-flag"></i></span><span>Cities</span></a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('view-country')">
                                <li class=""><a href="${contextPath}/countries" id="countries" onclick="savesidebar('countries');" class=""><span class="pcoded-micon"><i class="feather icon-globe"></i></span><span>Countries</span></a></li>
                            </sec:authorize>
                           
                          <%--   <sec:authorize access="hasAuthority('view-locationType')">
                                <li class=""><a href="${contextPath}/locationTypes" class=""><span class="pcoded-micon"><i class="feather icon-layers"></i></span><span>Location Types</span></a></li>
                            </sec:authorize> --%>
                        </ul>
                    </li>

                </sec:authorize>
                
                  
				
				<sec:authorize access="hasAnyAuthority('create-account,create-accountType')">
                     <li data-username="Menu levels Menu level 2.1 Menu level 2.2" class="nav-item pcoded-hasmenu" style="background-color: #3f4d67">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-book"></i></span><span class="pcoded-mtext">Accounting</span></a>
                        <ul class="pcoded-submenu">
                           <%-- <sec:authorize access="hasAuthority('create-accountType')">
                                <li class=""><a href="${contextPath}/underConstruction" id="underConstruction" onclick="savesidebar('underConstruction');"  class="">Customer Invoices</a></li>
                            </sec:authorize> --%>
                               <sec:authorize access="hasAuthority('create-accountType')">
                                <li class=""><a href="${contextPath}/raseelAccount" id="raseelAccount" onclick="savesidebar('raseelAccount');"  class="">Raseel Account</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('create-accountType')">
                                <li class=""><a href="${contextPath}/accountTypes" id="accountTypes" onclick="savesidebar('accountTypes');"  class="">View Account Types</a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('create-account')">
                                <li class=""><a href="${contextPath}/accounts" id="accounts" onclick="savesidebar('accounts');"  class="">View Account Heads</a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('view-ledger')">
                                <li class=""><a href="${contextPath}/ledgers" id="ledgers" onclick="savesidebar('ledgers');"  class="">Ledgers</a></li>
                            </sec:authorize>
                           <sec:authorize access="hasAuthority('driverAccounts')">
                                <li class=""><a href="${contextPath}/driverAccounts" id="driverAccounts" onclick="savesidebar('driverAccounts');"  class="">Driver Cash Stats</a></li>
                            </sec:authorize>
                              <sec:authorize access="hasAuthority('driverAccounts')">
                                <li class=""><a href="${contextPath}/driverDashboard" id="driverDashboard" onclick="savesidebar('driverDashboard');"  class="">Driver Dashboard</a></li>
                            </sec:authorize>
                              <sec:authorize access="hasAuthority('cashToBankDeposit')">
                                <li class=""><a href="${contextPath}/cashToBankDeposit" id="cashToBankDeposit" onclick="savesidebar('cashToBankDeposit');"  class="">Cash to Bank Deposit</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('bankBook')">
                                <li class=""><a href="${contextPath}/bankBook" id="bankBook" onclick="savesidebar('bankBook');"  class="">Raseel Bank Book</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('clientSettlement')">
                                <li class=""><a href="${contextPath}/clientSettlement" id="clientSettlement" onclick="savesidebar('clientSettlement');"  class="">Client Settlement</a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('clientSettlement')">
                                <li class=""><a href="${contextPath}/clientAdvance" id="clientAdvance" onclick="savesidebar('clientAdvance');"  class="">Client Advance Accounts</a></li>
                            </sec:authorize>
                          <%--   <sec:authorize access="hasAuthority('generateInvoices')">
                                <li class=""><a href="${contextPath}/generateInvoices" id="generateInvoices" onclick="savesidebar('generateInvoices');"  class="">Generate Invoices</a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('generateInvoices')">
                                <li class=""><a href="${contextPath}/viewInvoices" id="viewInvoices" onclick="savesidebar('viewInvoices');"  class="">View Invoices</a></li>
                            </sec:authorize> --%>
                        </ul>
                    </li>
                </sec:authorize>


                <sec:authorize access="hasAnyAuthority('create-role','create-permission','check-permissions')">
                    <li data-username="Menu levels Menu level 2.1 Menu level 2.2" class="nav-item pcoded-hasmenu" style="background-color: #3f4d67">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-menu"></i></span><span class="pcoded-mtext">Roles & Permission</span></a>
                        <ul class="pcoded-submenu">
                            <sec:authorize access="hasAuthority('create-role')">
                                <li class=""><a href="${contextPath}/role" id="role" onclick="savesidebar('role');" class="">Add Role</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('create-permission')">
                                <li class=""><a href="${contextPath}/permission" id="permission" onclick="savesidebar('permission');" class="">Add Permission</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('check-permissions')">
                                <li class=""><a href="${contextPath}/checkPermissionss" id="checkPermissionss" onclick="savesidebar('checkPermissionss');" class="">Manage Role & Permissions</a></li>
                            </sec:authorize>
                             <sec:authorize access="hasAuthority('view-status')">
                                <li class=""><a href="${contextPath}/statuses"  id="statuses" onclick="savesidebar('statuses');" class="">Status</a></li>
                            </sec:authorize>
                         
                        </ul>
                    </li>
                </sec:authorize>

 				<sec:authorize access="hasAnyAuthority('create-role','create-permission','check-permissions')">
                    <li data-username="Menu levels Menu level 2.1 Menu level 2.2" class="nav-item pcoded-hasmenu" style="background-color: #3f4d67">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-settings"></i></span><span class="pcoded-mtext">Settings</span></a>
                        <ul class="pcoded-submenu">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"></span><span class="pcoded-mtext">General</span></a>
                       
                            <sec:authorize access="hasAuthority('view-offDay')">
                                <li class=""><a href="${contextPath}/offDays"  id="offDays" onclick="savesidebar('offDays');" class="">Working Days</a></li>
                            </sec:authorize>
                           <%--  <sec:authorize access="hasAuthority('create-permission')">
                                <li class=""><a href="${contextPath}/underConstruction"  id="underConstruction" onclick="savesidebar('underConstruction');" class="">Pickup Until</a></li>
                            </sec:authorize> --%>
                            
                           <sec:authorize access="hasAuthority('version_control')">
                            
                           <a href="#!" class="nav-link"><span class="pcoded-micon"></span><span class="pcoded-mtext">Application</span></a>
                                <li class=""><a href="${contextPath}/listVersion"  id="listVersion" onclick="savesidebar('listVersion');" class="">Version Control</a></li>
                            </sec:authorize>
                                           
                        </ul>
                    </li>
                </sec:authorize>

            </ul>
            
            	<script>
						// YA ALLAH YOU ARE GREATEST // Used for sidebar Browser Storage
						function savesidebar(sidebarlink) {
							sessionStorage.setItem('sidebarlinkraseel', sidebarlink);
						}
						function checksidebar() {
							var data = sessionStorage.getItem('sidebarlinkraseel');
							if (data === null) {

							} else {
								//active nearest nav item
								
								var col = document.getElementById(data);
								col.style.color = "#1dc4e9";
								col.parentElement.classList.add("active");
								col.parentElement.parentElement.parentElement.classList
										.add("pcoded-trigger");
								col.parentElement.parentElement.style.display = "block";
								
							}

						}
						
						 function mobileCollapse(){
							var data = sessionStorage.getItem('sidebarlinkraseel');
							var data2 = sessionStorage.getItem('sidemenuhide');
							if (data2 === null) {
								sessionStorage.setItem('sidemenuhide', 'yes');
								var col = document.getElementById(data);
								col.style.color = "#1dc4e9";
								col.parentElement.classList.remove("active");
								col.parentElement.parentElement.parentElement.classList
										.remove("pcoded-trigger");
 								col.parentElement.parentElement.style.display = "none";
								
							} else {
								
								if(data2 == "yes"){
									sessionStorage.setItem('sidemenuhide', 'no');
									//active nearest nav item
									var col = document.getElementById(data);
									col.style.color = "#1dc4e9";
									col.parentElement.classList.add("active");
									col.parentElement.parentElement.parentElement.classList
											.add("pcoded-trigger");
	 								col.parentElement.parentElement.style.display = "block";
								}else{
									sessionStorage.setItem('sidemenuhide', "yes");

									//active nearest nav item
									var col = document.getElementById(data);
									col.style.color = "#1dc4e9";
									col.parentElement.classList.remove("active");
									col.parentElement.parentElement.parentElement.classList
											.remove("pcoded-trigger");
	 								col.parentElement.parentElement.style.display = "none";
									
								}
								
							}
						}
						//$(document).ready(function() {
							checksidebar();
						//});
					</script>
					
        </div>
    </div>
</nav>
<!-- [ navigation menu ] end -->

