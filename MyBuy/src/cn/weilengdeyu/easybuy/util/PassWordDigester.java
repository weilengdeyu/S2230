package cn.weilengdeyu.easybuy.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.log4j.Logger;
import org.junit.Test;
 
 /**
  * 将密码进行MD5加密处理
  */
public class PassWordDigester {
 
    private static Logger logger = Logger.getLogger(PassWordDigester.class);
 
    private static final String ALGORITHM_MD5 = "MD5";
 
    /**
     * Encrypt the password with MD5
     * @param pass the password to encryption
     * @return encryption string
     */
    public static String getPassMD5(String pass) {
        String keys = null;
        try {
            MessageDigest md = MessageDigest.getInstance(ALGORITHM_MD5);
            if (pass == null) {
                pass = "";
            }
            byte[] bPass = pass.getBytes("UTF-8");
            md.update(bPass);
//            keys = new String(md.digest(), "GBK");
            keys = bytesToHexString(md.digest());
        }
        catch (NoSuchAlgorithmException aex) {
            logger.error("there is no " + ALGORITHM_MD5 + " Algorithm!");
        }
        catch (java.io.UnsupportedEncodingException uex) {
            logger.error("can not encode the password - " + uex.getMessage());
        }
        return keys;
    }
     
    /**
     * 将beye[]转换为十六进制字符串
     * @param bArray
     * @return
     */
   public static final String bytesToHexString(byte[] bArray) {
     StringBuffer sb = new StringBuffer(bArray.length);
     String sTemp;
     for (int i = 0; i < bArray.length; i++) {
      sTemp = Integer.toHexString(0xFF & bArray[i]);
      if (sTemp.length() < 2){
       sb.append(0);
      }
      sb.append(sTemp.toUpperCase());
     }
     return sb.toString();
  }
 
 @Test
  public  void test(){
	
   /*String a = "图书";
  
   String resultString=a.format("txt=%s", a);*/
   System.out.println( getPassMD5("1"));
  }
}