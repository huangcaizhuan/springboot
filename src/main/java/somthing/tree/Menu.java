package somthing.tree;

public class Menu {

	private long id;
	private int parentId;
	private int level;
	
	 public Menu() {
         
	    }
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
