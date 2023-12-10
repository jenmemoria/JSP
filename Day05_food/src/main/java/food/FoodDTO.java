package food;

public class FoodDTO {
	private int idx;
	private String store;
	private String food1;
	private String food2;
	private String food3;
	
	private static int seq = 0;

	public static int getSeq() {
		return seq;
	}
	
	public FoodDTO() {
		this.idx = ++seq;
	}
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getFood1() {
		return food1;
	}

	public void setFood1(String food1) {
		this.food1 = food1;
	}

	public String getFood2() {
		return food2;
	}

	public void setFood2(String food2) {
		this.food2 = food2;
	}

	public String getFood3() {
		return food3;
	}

	public void setFood3(String food3) {
		this.food3 = food3;
	}


	public static void setSeq(int seq) {
		FoodDTO.seq = seq;
	}
	
	
}
