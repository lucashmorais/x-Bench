
public class InputSet {
	final int numSmallFiles;
	final int numMediumFiles;
	final int numLargeFiles;
	final int maxReads;
	final String inputName;
	
	TimeMeasure[] writeMeasures;
	TimeMeasure[] readMeasures;
	
	public InputSet (int nSmall, int nMedium, int nLarge, int nReads, String name)
	{
		numSmallFiles = nSmall;
		numMediumFiles = nMedium;
		numLargeFiles = nLarge;
		maxReads = nReads;
		
		writeMeasures = new TimeMeasure[3];
		readMeasures = new TimeMeasure[3];
		
		for (int i = 0; i < 3; i++)
		{
			writeMeasures[i] = new TimeMeasure();
			readMeasures[i] = new TimeMeasure();
		}
		
		inputName = name;
	}
	
	@Override
	public String toString() {
		return inputName;
	}
	
	public long totalWriteElapsedTime ()
	{
		long time = 0;
		
		for (TimeMeasure m: writeMeasures)
		{
			time += m.elapsedTime();
		}
		
		return time;
	}

	public long totalReadElapsedTime ()
	{
		long time = 0;
		
		for (TimeMeasure m: readMeasures)
		{
			time += m.elapsedTime();
		}
		
		return time;
	}
	
	public void printDetailedWriteInfo()
	{
		TimeMeasure[] measure = writeMeasures;
		
		float[] time = new float[3];
		float[] speed = new float[3];
		int[] numFiles = {numSmallFiles, numMediumFiles, numLargeFiles};
		int[] numPagesInFile = {Constants.smallSizePageNumber, Constants.mediumSizePageNumber, Constants.largeSizePageNumber};
		String[] string = {"small", "medium", "large", "total"};
		
		for (int i = 0; i < 3; i++)
		{
			time[i] = measure[i].elapsedTime() / 1000000000.f;
			speed[i] = numFiles[i] * numPagesInFile[i] / (Constants.pagesInMB * time[i]);
			System.out.println("\t" + string[i] + ": " + time[i] + "\t( " + speed[i] + "MB/s )");
		}
	}
	
	public void printDetailedReadInfo()
	{
		TimeMeasure[] measure = readMeasures;
		
		float[] time = new float[3];
		float[] speed = new float[3];
		int[] numFiles = {numSmallFiles, numMediumFiles, numLargeFiles};
		int[] numPagesInFile = {Constants.smallSizePageNumber, Constants.mediumSizePageNumber, Constants.largeSizePageNumber};
		String[] string = {"small", "medium", "large", "total"};
		
		for (int i = 0; i < 3; i++)
		{
			time[i] = measure[i].elapsedTime() / 1000000000.f;
			speed[i] = numFiles[i] * numPagesInFile[i] / (Constants.pagesInMB * time[i]);
			System.out.println("\t|" + string[i] + ": " + time[i] + "\t\t( " + speed[i] + "MB/s )");
		}
	}
	
	public float accumulatedReadTime()
	{
		float sum = 0;
		
		for (int i = 0; i < 3; i++)
		{
			sum += readMeasures[i].elapsedTime() / 1000000000.f;
		}
		
		return sum;
	}
	
	public float accumulatedWriteTime()
	{
		float sum = 0;
		
		for (int i = 0; i < 3; i++)
		{
			sum += writeMeasures[i].elapsedTime() / 1000000000.f;
		}
		
		return sum;
	}
	
	public float accumulatedTime()
	{
		float sum = 0;
		
		sum += accumulatedReadTime();
		sum += accumulatedWriteTime();
		
		return sum;
	}
	
	public void printAccumulatedReadTime()
	{
		System.out.println(accumulatedReadTime());
	}
	
	public void printAccumulatedWriteTime()
	{
		System.out.println(accumulatedWriteTime());
	}
	
	public void printAccumulatedTime()
	{
		System.out.println(accumulatedTime());
	}
	
	public void printDetailedInfo() {
		System.out.println(">> Elapsed times");
		System.out.println("   - write-test");
		printDetailedWriteInfo();
		System.out.println("   - read-test");
		printDetailedReadInfo();
	}
}
