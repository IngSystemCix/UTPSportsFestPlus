package logic;

public class Enfrentamiento {
    private int id;
    private String equipoLocal;
    private String equipoVisitante;
    private String fechaHora;
    private String deporte;
    private String estado;

    public Enfrentamiento() {
    }

    public Enfrentamiento(int id, String equipoLocal, String equipoVisitante, String fechaHora, String deporte, String estado) {
        this.id = id;
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
        this.fechaHora = fechaHora;
        this.deporte = deporte;
        this.estado = estado;
    }

    public Enfrentamiento(int id) {
        this.id = id;
    }

    // Getters y Setters
    public String getEquipoLocal() {
        return equipoLocal;
    }

    public void setEquipoLocal(String equipoLocal) {
        this.equipoLocal = equipoLocal;
    }

    public String getEquipoVisitante() {
        return equipoVisitante;
    }

    public void setEquipoVisitante(String equipoVisitante) {
        this.equipoVisitante = equipoVisitante;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getDeporte() {
        return deporte;
    }

    public void setDeporte(String deporte) {
        this.deporte = deporte;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
