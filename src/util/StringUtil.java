package util;

public class StringUtil {

	/**
	 * @Title: isEmpty 
	 * @Description: TODO(判断字符串是不是为空) 
	 * @param @param str
	 * @param @return    设定文件 
	 * @return boolean    返回类型 
	 * @throws
	 */
	public static boolean isEmpty(String str) {
		if (str == null || str.equals("")) {
			return true;
		}
		return false;
	}
}
