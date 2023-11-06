package logic;

public class Recordatorio {
    private String titulo;
    private String fechaHora;

    private String estado;

    public Recordatorio(String titulo, String fechaHora, String estado) {
        this.titulo = titulo;
        this.fechaHora = fechaHora;
        this.estado = estado;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
