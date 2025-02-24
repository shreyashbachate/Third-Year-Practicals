import java.io.*;
import java.util.*;
public class Pass2 {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		BufferedReader irb = new BufferedReader(new FileReader("ic.txt"));
		BufferedReader mdtb = new BufferedReader(new FileReader("mdt.txt"));
		BufferedReader kpdtb = new BufferedReader(new FileReader("kpdtab.txt"));
		BufferedReader mntb = new BufferedReader(new FileReader("mnt.txt"));
		
		FileWriter fr = new FileWriter("Pass2.txt");
		FileWriter apt = new FileWriter("apt.txt");
		
		HashMap<String , MNTEntry> mnt = new HashMap<>();
		HashMap<Integer , String> aptab = new HashMap<>();
		HashMap<String , Integer> aptabInverse = new HashMap<>();
		
		Vector<String> mdt = new Vector<String>();
		Vector<String> kpdt = new Vector<String>();
		
		int pp,kp,mdtp,kpdtp,paramNo;
		String line;
		while((line = mdtb.readLine()) != null)
		{
			mdt.addElement(line);
		}
		
		while((line = kpdtb.readLine()) != null)
		{
			kpdt.addElement(line);
		}
		
		while((line = mntb.readLine()) != null)
		{
			String parts[] = line.split("\\s+");
			mnt.put(parts[0], new MNTEntry(parts[0] ,Integer.parseInt(parts[1]) ,Integer.parseInt(parts[2]) ,Integer.parseInt(parts[3]) ,Integer.parseInt(parts[4])));
			
		} 
		
		while((line = irb.readLine()) != null)
		{
			String[] parts = line.split("\\s+");
			if(mnt.containsKey(parts[0]))
			{
				pp = mnt.get(parts[0]).getPp();
				kp = mnt.get(parts[0]).getKp();
				kpdtp = mnt.get(parts[0]).getKpdtp();
				mdtp = mnt.get(parts[0]).getMdtp();
				paramNo = 1;
				for(int i=0;i<pp;i++)
				{
					parts[paramNo] = parts[paramNo].replace(",","");
					aptab.put(paramNo, parts[paramNo]);
					aptabInverse.put(parts[paramNo],paramNo);
					paramNo++;
				}
				int j = kpdtp -1;
				
				for(int i=0;i<kp;i++)
				{
					String temp[] = kpdt.get(j).split("\t");
					aptab.put(paramNo, temp[1]);
					aptabInverse.put(temp[0],paramNo);
					j++;
					paramNo++;
				}
				
				for(int i=pp+1;i<parts.length;i++)
				{
					parts[i] = parts[i].replace(",","");
					String splits[] = parts[i].split("=");
					String name = splits[0].replaceAll("&","");
					aptab.put(aptabInverse.get(name),splits[1]);
				}
				
				int i= mdtp - 1;
				while(!mdt.get(i).equalsIgnoreCase("MEND"))
				{
					String splits[] = mdt.get(i).split("\\s+");
					fr.write("+");
					for(int k=0;k<splits.length;k++)
					{
						if(splits[k].contains("(P,"))
						{
							splits[k] = splits[k].replaceAll("[^0-9]", "");
							String value = aptab.get(Integer.parseInt(splits[k]));
							fr.write(value+"\t");
						}
						else
						{
							fr.write(splits[k]+"\t");
						}
					}
					fr.write("\n");
					i++;
				}
				
				Iterator<String> it = aptab.values().iterator();
				while(it.hasNext())
				{
					apt.write(it.next()+"\t");	
				}
				apt.write("\n");
				aptab.clear();
				aptabInverse.clear();
			}
			else
			{
				fr.write(line+"\n");
			}
			
		}
		System.out.println("Pass 2 Done");
		fr.close();
		apt.close();
		mntb.close();
		mdtb.close();
		kpdtb.close();
		irb.close();
		

	}

}
