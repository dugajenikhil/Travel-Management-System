<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import= "com.travels.repository.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
    
<jsp:include page="header.jsp" />  
    
    
<%
	HttpSession login=request.getSession();
	if(login.getAttribute("email")!=null){
%>
	
          <!-- The Modal (Add)-->
          <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
              
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">Add New Bus</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body (Form) -->
                <div class="modal-body">
                
                  <form action="AddBus" name="add_details_form" onsubmit="return validateAddForm();">
                    <div class="form-row col-md-12">
                    <div class="form-group col-md-4">
                        <label for="inputState">Travels</label>
                        <select name="travelid" class="form-control">
                        <% 
                        ResultSet rs=TravelsDao.getTravelNames();
                        while(rs.next()){
               			%>
                          <option value='<%= rs.getInt(1) %>'><%= rs.getString(2) %></option>
                        <%
                        }
                        %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputState">Type</label>
                        <select name="bus_type" class="form-control">
                          <option selected>AC</option>
                          <option>Non-AC</option>
                          <option>Sleeper</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-row col-md-12">
                      
                      <div class="form-group col-md-6">
                        <label for="inputPassword4">Number</label>
                        <input type="text" name="bus_number" class="form-control" placeholder="Eg-MH15DC7986">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputState">Capacity</label>
                        <select name="bus_capacity" class="form-control">
                          <option>11</option>
                          <option>12</option>
                          <option>13</option>
                          <option>14</option>
                          <option>15</option>
                          <option>16</option>
                          <option>17</option>
                          <option>18</option>
                          <option>19</option>
                          <option>20</option>
                          <option>21</option>
                          <option>22</option>
                          <option>23</option>
                          <option>24</option>
                          <option selected>25</option>
                          <option>26</option>
                          <option>27</option>
                          <option>28</option>
                          <option>29</option>
                          <option>30</option>
                        </select>
                      </div>   
                  </div>
                  
                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Submit" />
                    <input type="cancel" class="btn btn-secondary" data-dismiss="modal" value="Cancel" />
                    </form>
                  </div>
                </div>
            </div>
          </div>

          
          <!-- Page Heading -->
          <!-- <h1 class="h3 mb-2 text-gray-800">Buses</h1> -->
  
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="row">
                <div class="col-sm-8"><h4 style="line-height:inherit;" class="m-0 font-weight-bold text-primary">Buses</h4></div>
                <!-- Button to Open the Modal -->
                <div align="right" class="col-sm-4">
                  <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#myModal">
                    <span class="icon text-white-50"><i class="fas fa-plus"></i></span>
                    <span class="text">Add New Bus</span>
                  </a>
                </div>
                <!-- End of Button -->
              </div> 
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Type</th>
                      <th>Number</th>
                      <th>Capacity</th>
                      <th>Travels</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <%
                  ResultSet result= BusesDao.getBusDetails();
                  while(result.next()) {
                  %>	  
                 
                    <tr>
                      <td><%=result.getString(2) %></td>
                      <td><%=result.getString(3) %></td>
                      <td><%=result.getString(4) %></td>
                      <td><%=result.getString(5) %></td>
                      <td>
                        <a href="EditBus.jsp?busid=<%=result.getInt(1) %>" class="btn btn-info btn-circle btn-sm"><!-- data-toggle="modal" data-target="#myModal_update -->
                          <i class="fas fa-edit"></i>
                        </a>

                        <a href="DeleteBus?busid=<%=result.getInt(1) %>" onclick="return confirm('Do you want do really delete?');" class="btn btn-danger btn-circle btn-sm">
                          <i class="fas fa-trash"></i>
                        </a>
                      </td>
                    </tr>
					<%
					}
					%>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
<%
}else{
	response.sendRedirect("login.jsp");
}
	
%>
        <jsp:include page="footer.jsp" />  
        