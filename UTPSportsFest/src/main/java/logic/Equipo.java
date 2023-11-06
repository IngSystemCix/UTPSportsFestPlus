package logic;

public class Equipo {
    private int id;
    private String logoEquipo;
    private String nombreEquipo;
    private int entrenadorId;
    private int eventoId;

    public Equipo(int id, String logoEquipo, String nombreEquipo, int entrenadorId, int eventoId) {
        this.id = id;
        this.logoEquipo = logoEquipo;
        this.nombreEquipo = nombreEquipo;
        this.entrenadorId = entrenadorId;
        this.eventoId = eventoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogoEquipo() {
        return logoEquipo;
    }

    public void setLogoEquipo(String logoEquipo) {
        this.logoEquipo = logoEquipo;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public int getEntrenadorId() {
        return entrenadorId;
    }

    public void setEntrenadorId(int entrenadorId) {
        this.entrenadorId = entrenadorId;
    }

    public int getEventoId() {
        return eventoId;
    }

    public void setEventoId(int eventoId) {
        this.eventoId = eventoId;
    }
}
