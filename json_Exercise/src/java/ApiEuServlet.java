import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(urlPatterns = {"/eu.json"})
public class ApiEuServlet extends HttpServlet {
    private ArrayList<String> list;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
            list = new ArrayList<>();
            list.add("Programação Orientada a Objetos");
            list.add("Sistemas Operacionais II");
            list.add("Programação Web IV");
            list.add("Engenharia de Software III");
            list.add("Metodologia de Pesquisa Científico-Tecnológica");
            list.add("Banco de Dados");
        
        try (PrintWriter out = response.getWriter()) {
         
            
            JSONObject obj = new JSONObject();
            JSONArray arr = new JSONArray();
            for(String e: list){
                arr.put(e);
            }
            obj.put("RA","1290482123011");
            obj.put("Nome","Endrews Nunes de Azevedo");
            obj.put("list",list);
            out.print(obj.toString());
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
