
public class TimeMeasure {
	private long elapsedTime;
	private long currentTime;
	
	public TimeMeasure ()
	{
		elapsedTime = 0;
	}
	
	public void start ()
	{
		currentTime = System.nanoTime();
	}
	
	public void stop ()
	{
		elapsedTime += System.nanoTime() - currentTime;
	}
	
	public long elapsedTime()
	{
		return elapsedTime;
	}
	
	@Override
	public String toString() {
		return Long.toString(elapsedTime);
	}
}
