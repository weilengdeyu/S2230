package cn.weilengdeyu.easybuy.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class Validator {
	private Map<String, String> parameters;
	private Map<String, String> errors = new HashMap<String, String>();
	public Validator(){
		this.parameters = parameters;
	}
	public Validator(Map<String, String> parameters) {
		this.parameters = parameters;
	}
	/**
	 * 写一个方法，添加对应表单元素的错误信息
	 * @param fieldName 表单元素的name属性  
	 * @param errorMessage  错误信息
	 */
	public void addError(String fieldName, String errorMessage) {
		errors.put(fieldName, errorMessage);
	}
	public static Map<String, String> toSingleParameters(HttpServletRequest req) {
		Map<String, String> rtn = new HashMap<String, String>();
		Enumeration parameterNames = req.getParameterNames();
		while(parameterNames.hasMoreElements()) {
			String param = (String) parameterNames.nextElement();
			String[] values = req.getParameterValues(param);
			if (values != null)
				rtn.put(param, values[0]);
		}
		return rtn;
	}
	public boolean hasErrors() {
		return errors.size() > 0;
	}

	public boolean checkRequiredError(String fieldName) {
		String value = parameters.get(fieldName);
		if (isEmpty(value)) {
			errors.put(fieldName, "不能为空2");
			return true;
		}
		return false;
	}
	public static boolean isEmpty(String str) {
		return (str == null || "".equals(str.trim()));
	}
	public void addEmptyError(String fieldName) {
		errors.put(fieldName, "不能为空");
	}

	public Map<String, String> getErrors() {
		return errors;
	}
	public boolean checkRequiredError(String[] fieldNames) {
		boolean hasError = false;
		for (String fieldName : fieldNames) {
			if (checkRequiredError(fieldName))
				hasError = true;
		}
		return hasError;
	}
}
