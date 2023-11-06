package logic;

public class Usuario {
    private String codigo;
    private String contrasena;

    public Usuario() {
    }

    public Usuario(String codigo, String contrasena) {
        this.codigo = codigo;
        this.contrasena = contrasena;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
