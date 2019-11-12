package kr.co.mydomain.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dsff
 */
@WebServlet("/")
public class ControllerAction extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();
	
	public void init(ServletConfig config) throws ServletException {
		loadProperties("kr.co.mydomain.properties.command");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void loadProperties(String path) {
		// name=kr.co.mydomain.properties.command
		ResourceBundle rbHome = ResourceBundle.getBundle(path);
		
		// set=[/detail.do, /list.do]
		Enumeration<String> actionEnumHome = rbHome.getKeys();
		while(actionEnumHome.hasMoreElements()) {
			// /detail.do
			String command = actionEnumHome.nextElement();
			// kr.co.mydomain.action.DetailAction
			String className = rbHome.getString(command);
			
			try {
				Class<?> commandClass = Class.forName(className);
				// kr.co.mydomain.action.DetailAction@65c5aa04
				Object commandInstance = commandClass.newInstance();
				// {/detail.do=kr.co.mydomain.action.DetailAction@42acd3bf}
				commandMap.put(command, commandInstance);
			} catch(ClassNotFoundException e) {
				continue;
			} catch(InstantiationException e) {
				e.printStackTrace();
			} catch(IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandAction com =null;
		
		try {
			// /MVCAdv/list.do
			String command = request.getRequestURI();
			// /MVCAdv
			System.out.println(request.getContextPath());
			if(command.indexOf(request.getContextPath())==0) {
				// /list.do
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction) commandMap.get(command);
			if(com == null) {
				System.out.println("not found: "+command);
				return;
			}
			view = com.requestPro(request, response);
			// list.jsp
			if(view == null) {
				return;
			}
		} catch(Throwable e) {
			throw new ServletException();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
