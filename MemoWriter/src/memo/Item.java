package memo;

public class Item {
	String name;
	int length;
	String value;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String raw() {	// 객체의 value를 String 타입으로 반환
		StringBuffer padded = new StringBuffer(this.value);
		while(padded.toString().getBytes().length < this.length) {
			padded.append(' ');
		}
		return padded.toString();			
	}
	public static Item create(String name, int length, String value) {
		Item item = new Item();
		item.setName(name);
		item.setLength(length);
		item.setValue(value);
		return item;
	}
//	private String id;
//	private String pw;
//	
//	public RegisterInfo(String id, String pw) {
//		this.id = id;
//		this.pw = pw;
//	}
//	public String stringForSave() {
//		String saveId = id;
//		String savePw = pw;
//		if(id.length() < 10) {
//			for(int i = 0; i < 10 - id.length(); i++) {
//				saveId += " ";
//			}
//		}
//		if(pw.length() < 15) {
//			for(int i = 0; i < 15 - pw.length(); i++) {
//				savePw += " ";
//			}
//		}
//		return saveId + savePw + System.lineSeparator();
//	}
//	public String stringForCheck() {
//		String saveId = id;
//		String savePw = pw;
//		if(id.length() < 10) {
//			for(int i = 0; i < 10 - id.length(); i++) {
//				saveId += " ";
//			}
//		}
//		if(pw.length() < 15) {
//			for(int i = 0; i < 15 - pw.length(); i++) {
//				savePw += " ";
//			}
//		}
//		return saveId + savePw;
//	}
}
