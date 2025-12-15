package mx.gob.nafin.fiduciario.domain;

public class FCambNvmanual{

  private Long fcnFideicomiso = null;
  private Long fcnFolio = null;
  private String fcnTipoPers = null;
  private String fcnRfc = null;
    private String fcnNivelRiesgo = null;
    private String fcnMotivoRiesgo = null;

  public FCambNvmanual() {
    super();
  }

  public void setFcnFideicomiso(Long fcnFideicomiso) {
    this.fcnFideicomiso = fcnFideicomiso;
  }

  public Long getFcnFideicomiso() {
    return this.fcnFideicomiso;
  }
  
    public void setFcnFolio(Long fcnFolio) {
      this.fcnFolio = fcnFolio;
    }

    public Long getFcnFolio() {
      return this.fcnFolio;
    }  

  public void setFcnTipoPers(String fcnTipoPers) {
    this.fcnTipoPers = fcnTipoPers;
  }

  public String getFcnTipoPers() {
    return this.fcnTipoPers;
  }
  
    public void setFcnRfc(String fcnRfc) {
      this.fcnRfc = fcnRfc;
    }

    public String getFcnRfc() {
      return this.fcnRfc;
    }  
    
    public void setFcnNivelRiesgo(String fcnNivelRiesgo) {
      this.fcnNivelRiesgo = fcnNivelRiesgo;
    }

    public String getFcnNivelRiesgo() {
      return this.fcnNivelRiesgo;
    }  
    
    public void setFcnMotivoRiesgo(String fcnMotivoRiesgo) {
      this.fcnMotivoRiesgo = fcnMotivoRiesgo;
    }

    public String getFcnMotivoRiesgo() {
      return this.fcnMotivoRiesgo;
    }      
}
