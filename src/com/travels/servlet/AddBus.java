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
 * Servlet implementation class AddBus
 */
@WebServlet("/AddBus")
public class AddBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int travelid =Integer.parseInt(request.getParameter("travelid"));
		String Bus_type = request.getParameter("bus_type");
		String bus_number =request.getParameter("bus_number");
		int bus_capacity =Integer.parseInt(request.getParameter("bus_capacity"));
		BusBean bb= new BusBean();
		bb.setBusnumber(bus_number);
		bb.setBustype(Bus_type);
		bb.setCapacity(bus_capacity);
		bb.setTravelid(travelid);
		
		int status=0;
		try {
			status=BusesDao.addBus(bb);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("buses.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
