package entity;

public class product {
	
	int id;				
	String fullname;	//商品全名
	int type_id;		//商品类型
	String activity;	//活动
	String tip;			//提示信息
	String sale;		//促销信息
	String info;		//商品详情(用editor编辑器，直接放入html)
	double price;		//原价格
	double nowprice;	//现价格
	int salecount;		//销售数量
	int collectcount;	//收藏人数
	int priority;		//优先级
	int status;			//状态
	String pics;		//图片
	String comments;	//备注
	
	public String[] getPiclist() {
		if(pics==null||pics.length()<5)return new String[0];
		return pics.split(",");
	}
	public String getPic() {
		if(pics==null) return "";
		if(pics.length()<5)return "";
		String [] pic=pics.split(",");
		if(pic.length>0)
		return pic[0];
		else return "";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getNowprice() {
		return nowprice;
	}
	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getCollectcount() {
		return collectcount;
	}
	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPics() {
		return pics;
	}
	
	
	
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	
}
