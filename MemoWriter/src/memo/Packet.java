package memo;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

public class Packet {
	private ArrayList<Item> items = new ArrayList<>();
	private HashMap<String, Item> nameAccess = new HashMap<>();
	
	public void addItem(Item item) {
		items.add(item);
		if(nameAccess.containsKey(item.getName())) {
			throw new RuntimeException("이름이 중복됨" + item.getName());
		}
		nameAccess.put(item.getName(), item);
	}
	public Item getItem(String name) {
		return nameAccess.get(name);
	}
	
	public String raw() {	// items의 모든 item의 변수 value를 붙여서 String으로 반환
		StringBuffer result = new StringBuffer();
		for(Item item : items) {
			result.append(item.raw());
		}
		return result.toString();			
	}
	
	public void parse(String data) {	// items의 각 요소의 value를 설정하는 메소드
		byte[] bdata = data.getBytes();
		int pos = 0;
		for(Item item : items) {
			byte[] temp = new byte[item.getLength()];	// item의 길이만큼 담는 배열 temp 생성
			System.arraycopy(bdata, pos, temp, 0, item.getLength());
			// bdata의 pos에서부터의 값을 temp의 0에서부터 item의 length만큼 복사
			item.setValue(new String(temp));	// item의 value를 복사된 temp로 설정
			pos += item.getLength();	// pos를 다음 item의 시작 위치로 이동
		}
	}
	
	public static void main(String[] args) throws IOException {
		inputIdAndPw("jiyoung", "01054541323");
		inputMemo("jiyoung", "test memo is written");
		inputIdAndPw("jaehyun", "123123");
		inputMemo("jaehyun", "플라워 선샤인");
	}
	
	public static void inputIdAndPw(String id, String pw) throws IOException {
		Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB", "registerInfo.txt");
		Path idFolder = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB", id);
		if(!Files.exists(idFolder)) {
			Files.createDirectory(idFolder);	
		}
		saveIdAndPassword(path, id, pw);
	}
	
	public static void inputMemo(String id, String memo) throws IOException {
		Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB", id);
		if(!Files.exists(path)) {
			Files.createDirectory(path);	
		}
		Calendar rightNow = Calendar.getInstance();
		int y = rightNow.get(Calendar.YEAR) % 100;
		int month = rightNow.get(Calendar.MONTH) + 1;
		String m = "" + month;
		if(month < 10) m = "0" + month; 
		int day = rightNow.get(Calendar.DAY_OF_MONTH);
		String d = "" + day;
		if(day < 10) d = "0" + day;
		String today = "" + y + "." + m + "." + d + ".txt";
		path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB", id, today);
		saveText(path, memo);
	}
	
	public static byte[] returnByte(Packet p) {
		return (p.raw()+System.lineSeparator()).getBytes();
	}
	public static void savePacket(Path path, Packet packet) throws IOException {
		Files.write(path, returnByte(packet), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
	}
	
	public static void saveIdAndPassword(Path path, String name, String phoneNumber) throws IOException {
		Packet packet = new Packet();
		Item item1 = Item.create("ID", 10, name);
		Item item2 = Item.create("PW", 15, phoneNumber);
		packet.addItem(item1);
		packet.addItem(item2);
		savePacket(path, packet);
	}

	public static void saveText(Path path, String memo) throws IOException {
		Calendar rightNow = Calendar.getInstance();
		int h = rightNow.get(Calendar.HOUR_OF_DAY);
		int m = rightNow.get(Calendar.MINUTE);
		int s = rightNow.get(Calendar.SECOND);
		int ms = rightNow.get(Calendar.MILLISECOND);
		String hour = "" + h;
		String minute = "" + m;
		String second = "" + s;
		String mSecond = "" + ms;
		if(h < 10) hour = "0" + h;
		if(m < 10) minute = "0" + m;
		if(s < 10) second = "0" + s;
		if(ms < 10) mSecond = "00" + ms;
		else if(ms < 100) mSecond = "0" + ms;
		
		String time = ""+ hour + ":" + minute + ":" + second + ":" + mSecond;
		Packet packet = new Packet();
		Item item1 = Item.create("date", 12, time);
		Item item2 = Item.create("memo", memo.getBytes().length, memo);
		packet.addItem(item1);
		packet.addItem(item2);
		savePacket(path, packet);
	}
}
