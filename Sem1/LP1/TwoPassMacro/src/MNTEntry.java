
public class MNTEntry {

	String name;
	int pp,kp,mdtn,kpdtn;
	
	MNTEntry(String name,int pp,int kp,int mdtn,int kpdtn)
	{
		super();
		this.name = name;
		this.pp = pp;
		this.kp = kp;
		this.mdtn = mdtn;
		this.kpdtn = kpdtn;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	public void setPp(int pp)
	{
		this.pp = pp;
	}
	public void setKp(int kp)
	{
		this.kp = kp;
	}
	public void setMdtp(int mdtn)
	{
		this.mdtn = mdtn;
	}
	public void setKpdtp(int kpdtn)
	{
		this.kpdtn = kpdtn;
	}
	public String getName()
	{
		return name;
	}
	public int getPp()
	{
		return pp;
	}
	public int getKp()
	{
		return kp;
	}
	public int getMdtp()
	{
		return mdtn;
	}
	public int getKpdtp()
	{
		return kpdtn;
	}
}
