package searchInfo;

public class orders_SearchInfo {
	int max = 3;
	String txt="";
	static Integer pageno = 1;

	public Integer getPageno() {
		return pageno;
	}
	
	public static Integer getNext() {
		return pageno+1;
	}
	
	public static Integer getPrev() {
		return pageno>1?pageno-1:1;
	}

	public void setPageno(Integer pageno) {
		if (pageno == null || pageno < 1)
			pageno = 1;
		this.pageno = pageno;
		limit = " limit " + (pageno - 1) * max + "," + max;
	}
	
	public void setCanPage(boolean iscan) {
		if(!iscan) limit="";
	}

	String where="";
	String limit=" limit " + (pageno - 1) * max + "," + max;
	

	
	
	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		if(txt!=null&&txt.length()>0)
		this.txt = txt;
		where=" where date like '%"+ txt +"%'";
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		
		this.where = where;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

}
