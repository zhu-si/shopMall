package entity;

public class product {
	
	int id;				
	String fullname;	//��Ʒȫ��
	int type_id;		//��Ʒ����
	String activity;	//�
	String tip;			//��ʾ��Ϣ
	String sale;		//������Ϣ
	String info;		//��Ʒ����(��editor�༭����ֱ�ӷ���html)
	double price;		//ԭ�۸�
	double nowprice;	//�ּ۸�
	int salecount;		//��������
	int collectcount;	//�ղ�����
	int priority;		//���ȼ�
	int status;			//״̬
	String pics;		//ͼƬ
	String comments;	//��ע
	
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
