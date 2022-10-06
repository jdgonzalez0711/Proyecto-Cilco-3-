package controller;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import com.google.gson.Gson;

import beans.Biblioteca;
import connection.Conexion;

public class BibliotecaController implements IBibliotecaController {

    @Override
    public String listarSelecciones(String username) {

        Gson gson = new Gson();

        Conexion con = new Conexion();

        String sql = "Select l.id, l.titulo, l.categoria, a.fecha_seleccion from libros l "
                + "inner join biblioteca a on l.id = a.id_libros inner join usuarios u on a.username = u.username "
                + "where a.username = '" + username + "'";

        List<String> selecciones = new ArrayList<String>();

        try {

            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String categoria = rs.getString("categoria");
                Date fechaAlquiler = rs.getDate("fecha");

                Biblioteca biblioteca = new Biblioteca(id, titulo, fechaAlquiler, categoria);

                selecciones.add(gson.toJson(biblioteca));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.Desconectar();
        }
        return gson.toJson(selecciones);
    }
}
