
package beans;

import java.util.Date;

public class Biblioteca {
    
    Integer id;
    Date fecha_seleccion;
    Date fecha_inicio_lectura;
    Date fecha_fin_lectura;
    String comentario;
    String meta_lectura;
    Integer calificacion;
    Integer id_libro;
    String username;

    public Biblioteca(Integer id, Date fecha_seleccion, Date fecha_inicio_lectura, Date fecha_fin_lectura, String comentario, String meta_lectura, Integer calificacion, Integer id_libro, String username) {
        this.id = id;
        this.fecha_seleccion = fecha_seleccion;
        this.fecha_inicio_lectura = fecha_inicio_lectura;
        this.fecha_fin_lectura = fecha_fin_lectura;
        this.comentario = comentario;
        this.meta_lectura = meta_lectura;
        this.calificacion = calificacion;
        this.id_libro = id_libro;
        this.username = username;
    }

    public Biblioteca(int id, String titulo, java.sql.Date fechaAlquiler, String categoria) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha_seleccion() {
        return fecha_seleccion;
    }

    public void setFecha_seleccion(Date fecha_seleccion) {
        this.fecha_seleccion = fecha_seleccion;
    }

    public Date getFecha_inicio_lectura() {
        return fecha_inicio_lectura;
    }

    public void setFecha_inicio_lectura(Date fecha_inicio_lectura) {
        this.fecha_inicio_lectura = fecha_inicio_lectura;
    }

    public Date getFecha_fin_lectura() {
        return fecha_fin_lectura;
    }

    public void setFecha_fin_lectura(Date fecha_fin_lectura) {
        this.fecha_fin_lectura = fecha_fin_lectura;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getMeta_lectura() {
        return meta_lectura;
    }

    public void setMeta_lectura(String meta_lectura) {
        this.meta_lectura = meta_lectura;
    }

    public Integer getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(Integer calificacion) {
        this.calificacion = calificacion;
    }

    public Integer getId_libro() {
        return id_libro;
    }

    public void setId_libro(Integer id_libro) {
        this.id_libro = id_libro;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Biblioteca{" + "id=" + id + ", fecha_seleccion=" + fecha_seleccion + ", fecha_inicio_lectura=" + fecha_inicio_lectura + ", fecha_fin_lectura=" + fecha_fin_lectura + ", comentario=" + comentario + ", meta_lectura=" + meta_lectura + ", calificacion=" + calificacion + ", id_libro=" + id_libro + ", username=" + username + '}';
    }
  
}
