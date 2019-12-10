<jsp:include page="header.jsp" />  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import= "com.travels.repository.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
    
    
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#myModal_update").modal('show');
	});
</script>

<!-- The Modal (Update)-->
          <div class="modal fade" id="myModal_update">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
              
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">Update Bus Details</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                
                <!-- JSTL DbConnection -->
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/db_travels" user="root"  password="password"/>  
				<sql:query dataSource="${db}" var="rs"> SELECT busnumber from bus where busid=<%= request.getParameter("busid") %>; </sql:query>  
   
                <!-- Modal body (Form) -->
                <div class="modal-body">
                  <form action="UpdateBus">
                  <input type="hidden" name="bus_id" value="<%= request.getParameter("busid") %>">
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
                        <c:forEach var="result" items="${rs.rows}">
                        <input type="text" value="${result.busnumber}" name="bus_number" class="form-control" placeholder="Eg-MH15DC7986">
                        </c:forEach>
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
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </form>
                  </div>
                </div>
            </div>
          </div>