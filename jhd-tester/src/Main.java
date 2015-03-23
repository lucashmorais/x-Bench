
public class Main {
	
	public static void main(String[] args) {
		String testDir = "testfiles";
		
		if (args.length == 1)
			testDir = args[0];
		
		WriteTester wTester = new WriteTester(testDir);
		ReadTester rTester = new ReadTester(testDir);
		
		InputSet input = Constants.large;
		
		wTester.runInput(input);
		rTester.runInput(input);
		input.printAccumulatedTime();
	}

}
