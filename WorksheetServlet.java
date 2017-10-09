package worksheet.tsvietkovich.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

public class WorksheetServlet extends javax.servlet.http.HttpServlet{

    private AtomicInteger senseTrue = new AtomicInteger(0);
    private AtomicInteger senseFalse = new AtomicInteger(0);
    private AtomicInteger modelTrue = new AtomicInteger(0);
    private AtomicInteger modelFalse = new AtomicInteger(0);
    private AtomicInteger dualismTrue = new AtomicInteger(0);
    private AtomicInteger dualismFalse = new AtomicInteger(0);
    private AtomicInteger ageToTwenty = new AtomicInteger(0);
    private AtomicInteger ageToFifty = new AtomicInteger(0);
    private AtomicInteger ageAfterFifty = new AtomicInteger(0);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        Integer age = Integer.parseInt(req.getParameter("age"));

        HttpSession session = req.getSession(true);
        session.setAttribute("name",name);
        session.setAttribute("surname",surname);
        session.setAttribute("age",age);

        String sense = req.getParameter("sense");
        String model = req.getParameter("model");
        String dualism = req.getParameter("dualism");

        session.setAttribute("a",incrementValueIfTrue(sense,senseTrue));
        session.setAttribute("b",incrementValueIfFalse(sense,senseFalse));
        session.setAttribute("c",incrementValueIfTrue(model,modelTrue));
        session.setAttribute("d",incrementValueIfFalse(model,modelFalse));
        session.setAttribute("e",incrementValueIfTrue(dualism,dualismTrue));
        session.setAttribute("f",incrementValueIfFalse(dualism,dualismFalse));

        session.setAttribute("ageToTwenty",(age<=20)? ageToTwenty.incrementAndGet():ageToTwenty.get());
        session.setAttribute("ageToFifty",(age>20 && age<=50)? ageToFifty.incrementAndGet():ageToFifty.get());
        session.setAttribute("ageAfterFifty",(age>50)? ageAfterFifty.incrementAndGet():ageAfterFifty.get());

        resp.sendRedirect("index.jsp");
    }
    private Integer incrementValueIfTrue (String question, AtomicInteger value){
        return (question.equals("true")?value.incrementAndGet():value.get());
    }
    private Integer incrementValueIfFalse (String question, AtomicInteger value){
        return (question.equals("false")?value.incrementAndGet():value.get());
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String a = req.getParameter("a");

        HttpSession session = req.getSession(false);
        if ("out".equals(a) && session != null) {
            session.removeAttribute("name");
            session.removeAttribute("surname");
            session.removeAttribute("age");
        }

        resp.sendRedirect("index.jsp");
    }
}
