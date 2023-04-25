package jdbc;

public class NewsDTO {
	private int nno;
	private String ntitle;
	private String nupfolder;
	private String nuuid;
	private String nfilename;
	private String ndate;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNupfolder() {
		return nupfolder;
	}
	public void setNupfolder(String nupfolder) {
		this.nupfolder = nupfolder;
	}
	public String getNuuid() {
		return nuuid;
	}
	public void setNuuid(String nuuid) {
		this.nuuid = nuuid;
	}
	public String getNfilename() {
		return nfilename;
	}
	public void setNfilename(String nfilename) {
		this.nfilename = nfilename;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public NewsDTO(int nno, String ntitle, String nupfolder, String nuuid, String nfilename, String ndate) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.nupfolder = nupfolder;
		this.nuuid = nuuid;
		this.nfilename = nfilename;
		this.ndate = ndate;
	}
	public NewsDTO() {
	}
	
}
