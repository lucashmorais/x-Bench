import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;


public class ReadTester {
	int numberOfFiles;
	String inputsDir;	
	FileInputStream inputStream;
	
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
	
	public void readAllFilesFromDir (String dirPath, TimeMeasure measure) throws IOException
	{
		File f = new File(dirPath);
		
		for (File file: f.listFiles())
		{
			if (file.isDirectory())
				readAllFilesFromDir(file, measure);
			else
				readFile(file, measure);
		}
	}
	
	public void readAllFilesFromDir (File dirPath, TimeMeasure measure) throws IOException
	{		
		for (File file: dirPath.listFiles())
		{
			if (file.isDirectory())
				readAllFilesFromDir(file, measure);
			else
				readFile(file, measure);
		}
	}
	
	public void readInputSet (InputSet input) throws IOException
	{
		int[] pageNumber = {Constants.smallSizePageNumber, Constants.mediumSizePageNumber, Constants.largeSizePageNumber};
		String[] name = new String[3];
		String[] path = new String[3];
		
		for (int i = 0; i < 3; i++)
		{
			name[i] = pageNumber[i] + "pgs";
			path[i] = inputsDir + "/" + input + "/" + name[i];
			readAllFilesFromDir(path[i], input.readMeasures[i]);
		}
	}
	
	public ReadTester (String inputsDir)
	{
		this.inputsDir = inputsDir;
	}
	
	public static void main (String[] args) throws IOException
	{
		ReadTester readTester = new ReadTester("/home/lucas/Dropbox/Graduação/1Sem2015/archlab/projects/x-Bench/seq-hd/jhd-tester/output-test");
		
		readTester.readInputSet(Constants.small);
		Constants.small.printDetailedReadInfo();
	}
}
