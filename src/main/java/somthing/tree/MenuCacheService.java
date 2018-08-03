package somthing.tree;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MenuCacheService {

	 //菜单树形结构
    public static JSONArray treeMenuList(JSONArray menuList, int parentId) {
        JSONArray childMenu = new JSONArray();
        for (Object object : menuList) {
            JSONObject jsonMenu = JSONObject.fromObject(object);
            int menuId = jsonMenu.getInt("id");
            int pid = jsonMenu.getInt("parentId");
            if (parentId == pid) {
                JSONArray c_node = treeMenuList(menuList, menuId);
                jsonMenu.put("childNode", c_node);
                childMenu.add(jsonMenu);
            }
        }
        return childMenu;
    }
 
 public static void main(String args[]) {
        MenuCacheService menuCacheService = new MenuCacheService();
        JSONArray jsonArray = new JSONArray();
        
        
        Menu menu3 = new Menu();
        menu3.setId(3l);
        menu3.setParentId(2);
        menu3.setLevel(1);
        Menu menu4 = new Menu();
        menu4.setId(4l);
        menu4.setParentId(2);
        menu4.setLevel(1);
        
        Menu menu5 = new Menu();
        menu5.setId(5l);
        menu5.setParentId(4);
        menu5.setLevel(2);
        
        Menu menu6 = new Menu();
        menu6.setId(6l);
        menu6.setParentId(1);
        menu6.setLevel(1);
        
        Menu menu7 = new Menu();
        menu7.setId(7l);
        menu7.setParentId(6);
        menu7.setLevel(3);
 
        
        Menu menu1 =new Menu();
        menu1.setId(1l);
        menu1.setParentId(0);
        menu1.setLevel(0);
        Menu menu2 = new Menu();
        menu2.setId(2l);
        menu2.setParentId(0);
        menu2.setLevel(0);
        
        
        jsonArray.add(menu1);
        jsonArray.add(menu2);
        jsonArray.add(menu3);
        jsonArray.add(menu4);
        jsonArray.add(menu5);
        jsonArray.add(menu6);
        jsonArray.add(menu7);
 
        System.out.println(menuCacheService.treeMenuList(jsonArray,0));
        System.out.println("".equals(""));
    }
}
