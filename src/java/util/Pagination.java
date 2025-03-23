/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author macbookpro
 */
public class Pagination {
    
    public static int getPageSize(HttpServletRequest request, int rest) {
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null) {
            try {
                int size = Integer.parseInt(pageSizeParam);
                if (size == 5 || size == 15 || size == 25) {
                    return size;
                }
            } catch (NumberFormatException e) {
                // Ignore parse errors
            }
        }
        return rest; // Default page size
    }

    public static int getCurrentPage(HttpServletRequest request, int rest) {
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                return Math.max((int) 1, Integer.parseInt(pageParam));
            } catch (NumberFormatException e) {
                // Ignore parse errors
            }
        }
        return rest; // Default to first page
    }
}
