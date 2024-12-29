package org;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RateConverterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        double fromAmount = Double.parseDouble(request.getParameter("fromAmount"));
//        double exchangeRate = Double.parseDouble(request.getParameter("exchangeRate"));

        RateBean rateBean = new RateBean();
        rateBean.setFromAmount(fromAmount);
        try {
            // 这里使用的是X-Rates网站作为示例，你可以根据需要更换其他网站
            String url = "https://www.xe.com/zh-CN/currencyconverter/convert/?Amount=1&From=EUR&To=USD";
            Document doc = Jsoup.connect(url).get();
            Elements exchangeRateElements = doc.select("p.sc-63d8b7e3-1.bMdPIi");
//            System.out.println("here");
            if (!exchangeRateElements.isEmpty()) {
                String rateText = exchangeRateElements.first().text();
                rateBean.exchangeRate = Double.parseDouble(rateText.substring(0,8)); // 移除逗号并解析为double
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


//        rateBean.setExchangeRate(exchangeRate);
        rateBean.convert();

        request.setAttribute("rateBean", rateBean);
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
    }
}
