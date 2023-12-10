package food;

import java.util.ArrayList;
import java.util.List;

public class FoodDAO {
	
	private ArrayList<FoodDTO> list = new ArrayList<>();
	
	public List<FoodDTO> selectList(){
		// select * from food order by idx;
		return list;
	}
	
	// 단일 조회
	public FoodDTO selectOne(int idx) {
		// select * from food where idx = ?
		for(FoodDTO dto : list) {
			if(dto.getIdx() == idx) {
				return dto;
			}
		}
		return null;
	}
	
	// 추가
	public int insert(FoodDTO dto) {
		// insert into food (store, food1, food2, food3) values (?, ?, ?, ?);
		int row = list.add(dto) ? 1 : 0;
		return row;
	}
	
	// 삭제
	public int delete(int idx) {
		// delete book where idx = ?
		int row = list.removeIf(dto -> dto.getIdx() == idx) ? 1 : 0;
		return row;
	}
	
	// 추가한 이후 마지막으로 추가된 객체의 idx가 몇번인지 확인하는 기능
	public int currval() {
		// select food_seq.currval from dual;
		return FoodDTO.getSeq();
	}
}
