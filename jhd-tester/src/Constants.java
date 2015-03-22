
public class Constants {
	private Constants(){}
	
	//Especificação de páginas
	static final int pageByteSize = 4096;
	static final int pagesInMB = 1024 * 1024 / pageByteSize;
	
	//Tamanho de cada tipo de arquivo em número de páginas
	static final int smallSizePageNumber = 1;
	static final int mediumSizePageNumber = 16 * pagesInMB;
	static final int largeSizePageNumber = 512 * pagesInMB;
	
	//Input sets
	static final InputSet small = new InputSet(131072, 64, 1, "small");
	static final InputSet medium = new InputSet(393216, 192, 3, "medium");
	static final InputSet large = new InputSet(655360, 320, 5, "large");	
}
