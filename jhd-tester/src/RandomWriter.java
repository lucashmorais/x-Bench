import java.io.*;
import java.util.Random;


public class RandomWriter {
	String outputDir;
	Random random;
	long elapsedtime;
	
	RandomWriter(String outDir)
	{
		outputDir = outDir;
		random = new Random();
	}
	
	void writeFile(String dir, int byteSize, String name, TimeMeasure measure) throws IOException
	{
		byte[] bytes = new byte[byteSize];		
		random.nextBytes(bytes);
		
		if (measure != null) measure.start();
			FileOutputStream out = new FileOutputStream(dir + "/" + name);
			out.write(bytes);
			out.flush();
		if (measure != null) measure.stop();			
		out.close();
	}
	
	void writeBigFile(int MBSize, String name)
	{
		String dir = outputDir + "/" + "largeFiles";
		
		if (!createDir(dir))
			clearDir(dir);
	}
	
	void writeManyFiles(String subfolder, int pageSize, int numOfFiles, TimeMeasure measure) throws IOException
	{
		String dir;
		if (subfolder != null)
			dir = outputDir + "/" + subfolder + "/" + String.valueOf(pageSize) + "pgs";
		else
			dir = outputDir + "/" + String.valueOf(pageSize) + "pgs";
		
		if (!createDir(dir))
			clearDir(dir);
		
		for (int i = 0; i < numOfFiles; i++)
			writeFile(dir, pageSize * Constants.pageByteSize, i + ".rnd", measure);
	}
	
	void writeTotalSize(int totalMBSize, int pageSize, TimeMeasure measure) throws IOException
	{
		int numOfFiles;
		
		numOfFiles = (int) Math.ceil(totalMBSize * Constants.pagesInMB / ((double) pageSize));
		
		writeManyFiles(null, pageSize, numOfFiles, measure);
	}
	
	boolean createDir(String folderName)
	{
		File f = new File(folderName);
		
		if (!f.exists())
			return f.mkdirs();
		
		return false;
	}
	
	void clearDir(String folderName)
	{
		File f = new File(folderName);
		
		for (File c: f.listFiles())
			c.delete();
	}
}
