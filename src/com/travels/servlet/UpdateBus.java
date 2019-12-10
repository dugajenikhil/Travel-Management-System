package com.travels.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travels.entity.BusBean;
import com.travels.repository.BusesDao;

/**
 * Servlet implementation class UpdateBus
 */
@WebServlet("/UpdateBus")
public class UpdateBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bus_id= Integer.parseInt(request.getParameter("bus_id"));
		int travelid= Integer.parseInt(request.getParameter("travelid"));
		String bus_type= request.getParameter("bus_type");
		String bus_number= request.getParameter("bus_number");
		int bus_capacity= Integer.parseInt(request.getParameter("bus_capacity"));
		
		BusBean bb= new BusBean();
		bb.setBusid(bus_id);
		bb.setBusnumber(bus_number);
		bb.setBustype(bus_type);
		bb.setCapacity(bus_capacity);
		bb.setTravelid(travelid);
		
		int status=0;
		try {
			status=BusesDao.updateBus(bb);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (status>0) {
			response.sendRedirect("buses.jsp?add=1"); 
		}else {
			response.sendRedirect("buses.jsp?add=0"); 
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
