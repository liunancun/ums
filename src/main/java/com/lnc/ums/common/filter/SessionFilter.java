package com.lnc.ums.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Session过滤器
 */
public class SessionFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        String path = req.getServletPath();
        if (session.getAttribute("user") == null && !path.equals("/login.action")) {
            resp.sendRedirect(req.getContextPath() + "/login.action");
            return;
        }
        chain.doFilter(request, response);
    }

    public SessionFilter() {
    }

    public void destroy() {
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

}
