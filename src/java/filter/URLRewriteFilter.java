 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.CheckRole;

/**
 *
 * @author macbookpro
 */
public class URLRewriteFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured.
    private FilterConfig filterConfig = null;

    public URLRewriteFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("URLRewriteFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("URLRewriteFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed.
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

//        if (debug) {
//            log("URLRewriteFilter:doFilter()");
//        }
//        
//        doBeforeProcessing(request, response);
//        
//        Throwable problem = null;
//        try {
//            chain.doFilter(request, response);
//        } catch (Throwable t) {
//            // If an exception is thrown somewhere down the filter chain,
//            // we still want to execute our after processing, and then
//            // rethrow the problem after that.
//            problem = t;
//            t.printStackTrace();
//        }
//        
//        doAfterProcessing(request, response);
//
//        // If there was a problem, we want to rethrow it if it is
//        // a known type, otherwise log it.
//        if (problem != null) {
//            if (problem instanceof ServletException) {
//                throw (ServletException) problem;
//            }
//            if (problem instanceof IOException) {
//                throw (IOException) problem;
//            }
//            sendProcessingError(problem, response);
//        }
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        HttpSession session = req.getSession();

        // Remove context path from request URI
        String path = requestURI.substring(contextPath.length());

        //Auth        
        // -> Login gg
        if (path.matches("/auth/login") && request.getParameter("code") != null) {
            req.getRequestDispatcher("/DivideServlet?action=logingoogle").forward(request, response);
            return;
        }

        // -> Login
        if (path.matches("/auth/login")) {
            req.getRequestDispatcher("/DivideServlet?action=login").forward(request, response);
            return;
        }

        // -> register
        if (path.matches("/auth/register")) {
            req.getRequestDispatcher("/DivideServlet?action=register").forward(request, response);
            return;
        }

        // -> edit account
        if (path.matches("/edit/account")) {
            if (session.getAttribute("user") == null) {
                String newPath = req.getContextPath() + "/auth/login";
                resp.sendRedirect(newPath);
                return;
            }
            req.getRequestDispatcher("/DivideServlet?action=editaccount").forward(request, response);
            return;
        }

        // View
        // Handle lesson detail URLs
        if (path.matches("/view/course/lesson")) {
            req.getRequestDispatcher("/DivideServlet?action=lesson").forward(request, response);
            return;
        }
        
        // Handle course detail URLs
        if (path.matches("/view/course/\\d+")) {
            String courseId = path.substring(path.lastIndexOf('/') + 1);
            req.getRequestDispatcher("/DivideServlet?action=viewdetailscourse&id=" + courseId).forward(request, response);
            return;
        }
        
        

        if (path.startsWith("/view/")) {

            String action = path.substring(6); // Remove "/view/" prefix
            // Kiểm tra xem action có hợp lệ không
            if (!action.matches("home|material|course|test|account")) {
                action = "home"; // Mặc định là "home" nếu không hợp lệ
            }

            // Kiểm tra nếu chưa đăng nhập
            if (action.equals("account")) {
                if (session.getAttribute("user") == null) {
                    String newPath = req.getContextPath() + "/auth/login";
                    resp.sendRedirect(newPath);
                    return;
                }
            }

            session.setAttribute("option", action);
            req.getRequestDispatcher("/DivideServlet?action=view" + action).forward(request, response);
            return;
        }

        // Logout
        if (path.matches("/logout")) {
            req.getRequestDispatcher("/DivideServlet?action=logout").forward(request, response);
            return;
        }

        // Admin
        if (path.matches("/dashboard")) {
            String action = "dashboard";
            session.setAttribute("option", action);
            req.getRequestDispatcher("/DashboardManagementServlet").forward(request, response);
            return;
        }

        if (path.startsWith("/dashboard/")) {

            int check = CheckRole.checkRole(req, resp);
            if (check == -1) {
                String newPath = req.getContextPath() + "/auth/login";
                resp.sendRedirect(newPath);
                return;
            } else if (check == 1) {
                String newPath = req.getContextPath() + "/view/home";
                resp.sendRedirect(newPath);
            }

            // Nếu là admin, tiếp tục xử lý
            String action = path.substring(11); // Remove "/dashboard/" prefix
            // Kiểm tra xem action có hợp lệ không
            if (!action.matches("users|courses|materials|tests|settings")) {
                action = "users"; // Mặc định là "users" nếu không hợp lệ
            }

            session.setAttribute("option", action);

            req.getRequestDispatcher("/DivideServlet?action=admin" + action).forward(request, response);
            return;
        }

        chain.doFilter(request, response);

    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("URLRewriteFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("URLRewriteFilter()");
        }
        StringBuffer sb = new StringBuffer("URLRewriteFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
