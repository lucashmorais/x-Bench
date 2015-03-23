import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;


public class ReadTester {
	int numberOfFiles;
	String inputsDir;	
	FileInputStream inputStream;
	
	public ReadTester (String inputsDir)
	{
		this.inputsDir = inputsDir;
	}
	
	public void readFile(File file, TimeMeasure measure) throws IOException
	{
		measure.start();
		FileInputStream input = new FileInputStream(file);
		int length = input.available();
		byte[] b = new byte[length];		
		input.read(b, 0, length);
		input.close();
		measure.stop();
	}
	
	public void readAllFilesFromDir (String dirPath, TimeMeasure measure, int maxReads) throws IOException
	{
		File f = new File(dirPath);
		
		for (File file: f.listFiles())
		{
			if (maxReads <= 0)
				break;
			
			if (file.isDirectory())
				readAllFilesFromDir(file, measure, maxReads);
			else
			{
				readFile(file, measure);
				maxReads--;
			}
		}
	}
	
	public void readAllFilesFromDir (File dirPath, TimeMeasure measure, int maxReads) throws IOException
	{		
		for (File file: dirPath.listFiles())
		{
			if (maxReads <= 0)
				break;
			
			if (file.isDirectory())
				readAllFilesFromDir(file, measure, maxReads);
			else
			{
				readFile(file, measure);
				maxReads--;
			}
		}
	}
	
	public void runInput (InputSet input)
	{
		int[] pageNumber = {Constants.smallSizePageNumber, Constants.mediumSizePageNumber, Constants.largeSizePageNumber};
		int maxReads = input.maxReads;
		String[] name = new String[3];
		String[] path = new String[3];
		
		try
		{
			for (int i = 0; i < 3; i++)
			{
				name[i] = pageNumber[i] + "pgs";
				path[i] = inputsDir + "/" + input + "/" + name[i];
				readAllFilesFromDir(path[i], input.readMeasures[i], maxReads);
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main (String[] args) throws IOException
	{
		ReadTester readTester = new ReadTester("/home/lucas/Dropbox/Graduação/1Sem2015/archlab/projects/x-Bench/seq-hd/jhd-tester/output-test");
		
		readTester.runInput(Constants.small);
		Constants.small.printDetailedReadInfo();
	}
}
