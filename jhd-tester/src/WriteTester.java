import java.io.IOException;


public class WriteTester {
	String outputDir;
	
	public WriteTester (String outputDir)
	{
		this.outputDir = outputDir;
	}
	
	public void runInput (InputSet input)
	{
		RandomWriter writer = new RandomWriter(outputDir);
		
		try
		{
			writer.writeManyFiles(input.toString(), Constants.smallSizePageNumber, input.numSmallFiles, input.writeMeasures[0]);
			writer.writeManyFiles(input.toString(), Constants.mediumSizePageNumber, input.numMediumFiles, input.writeMeasures[1]);
			writer.writeManyFiles(input.toString(), Constants.largeSizePageNumber, input.numLargeFiles, input.writeMeasures[2]);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public void runAllInputs ()
	{
		InputSet[] sets = {Constants.small, Constants.medium, Constants.large};
		
		for (InputSet s: sets)
		{
			runInput(s);
		}
	}
}
