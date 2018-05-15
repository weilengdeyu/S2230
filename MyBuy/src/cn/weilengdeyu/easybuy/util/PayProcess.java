package cn.weilengdeyu.easybuy.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/*组织向支付宝发送的数据
 * */
public class PayProcess {
	private String partner;// 商户编号
	private String return_url;// 回调商户地址
	private String subject;// 商品名称
	private String body;// 商品描述
	private String out_trade_no;// 订单编号
	private String total_fee;// 总金额
	private String seller_email;// 卖家邮箱
	private String sign;// 数字签名
	private String key;// 密钥
	private String payGateUrl;// 支付地址

	 public PayProcess(String subject, String body, String out_trade_no, String total_fee)
     {
         this.subject = subject;
         
         this.body = body;
         this.out_trade_no = out_trade_no;
         this.total_fee = total_fee;
         
          String fileName="/data.properties";//这里是指放在classes下，如果有包的话，前面加包名即可。例：/com/web/db.properties  
         Properties p = new Properties();  
         try {  
        	 //IO
             InputStream in = PayProcess.class.getResourceAsStream(fileName);//这里有人用new FileInputStream(fileName),不过这种方式找不到配置文件。有人说是在classes下，我调过了，不行。  
             p.load(in);  
             in.close();  
             if(p.containsKey("partner")){  
            	 this.partner = p.getProperty("partner");  
             }  
             if(p.containsKey("return_url")){  
            	 this.return_url= p.getProperty("return_url");  
             }  
             if(p.containsKey("seller_email")){  
            	 this.seller_email = p.getProperty("seller_email");  
             }  
             if(p.containsKey("payGateUrl")){  //支付地址
                 this.payGateUrl = p.getProperty("payGateUrl");  
             }  
             if(p.containsKey("key")){
            	 this.key=p.getProperty("key");  
             }
            	 this.sign=PassWordDigester.getPassMD5(total_fee + partner + out_trade_no + subject + key).toLowerCase();//按照要求生成数字签名. 
             
         } catch (IOException ex) {  
             
         }  
   
     }
	 
	 //构建发给支付宝URL地址.
     public String GoPayPage()
     {
    	 //返回的是已经拼接好的 给支付宝传递特定格式数据的一个连接地址和Data
    	 System.out.println("aaaa"+subject);
    	 String url = String.format("%s?partner=%s&return_url=%s&subject=%s&body=%s&out_trade_no=%s&total_fee=%s&seller_email=%s&sign=%s", payGateUrl, partner,return_url, subject, body, out_trade_no, total_fee, seller_email, sign);
         return url;
    	
     }
	
	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getReturn_url() {
		return return_url;
	}

	public void setReturn_url(String return_url) {
		this.return_url = return_url;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getPayGateUrl() {
		return payGateUrl;
	}

	public void setPayGateUrl(String payGateUrl) {
		this.payGateUrl = payGateUrl;
	}

}
