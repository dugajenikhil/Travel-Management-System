package com.travels.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travels.repository.SeatsDao;

/**
 * Servlet implementation class SeatsServlet
 */
@WebServlet("/SeatsServlet")
public class SeatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totCnt=Integer.parseInt(request.getParameter("totCnt"));
		int arr[]=new int[totCnt];
		for (int i = 0; i < totCnt; i++) {
			if(request.getParameter("seat_no_"+i)!=null)
				arr[i]=Integer.parseInt(request.getParameter("seat_no_"+i));
		}
		int status=0;
		try {
			status=SeatsDao.updateSeatdetails(arr);
			System.out.println("Seat:"+status);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (status>0) {
			response.sendRedirect("bookticket.jsp?seats="+status+"&travels="+request.getParameter("travels")+"&type="+request.getParameter("type")+"&depart="+request.getParameter("depart")+"&arrival="+request.getParameter("arrival")+"&fare="+request.getParameter("fare")+"&from="+request.getParameter("from")+"&to="+request.getParameter("to")+"&date="+request.getParameter("date"));
		}else {
			response.sendRedirect("/Travels");
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
