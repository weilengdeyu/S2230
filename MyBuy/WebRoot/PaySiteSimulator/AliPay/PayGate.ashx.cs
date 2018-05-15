using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using PaySiteSimulator.AliPay.DataSetAliPayTableAdapters;

namespace PaySiteSimulator.AliPay
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class PayGate : AbstractPayGate
    {
        public override void ProcessRequest(HttpContext context)
        {
            base.ProcessRequest(context);
            string partner = GetNotNullValue("partner");
            string return_url = GetNotNullValue("return_url");
            string subject = GetNotNullValue("subject");//商品名称
            string body = GetNotNullValue("body");//商品描述
            string out_trade_no = GetNotNullValue("out_trade_no");
            string total_fee = GetNotNullValue("total_fee");
            string seller_email = GetNotNullValue("seller_email"); //卖家邮箱，必填
            string sign = GetNotNullValue("sign");

            var merchans = new MerchanTableAdapter().GetDataByMerchNum(partner);
            if (merchans.Count <= 0)
            {
                Response.Write("错误的商户编号");
                Response.End();
                return;
            }
            var merchan = merchans.Single();
            string key = merchan.MerchKey;//取出商户设置的key
            string md5Src = total_fee + partner + out_trade_no + subject + key;
            CheckMD5(sign, md5Src);

            decimal amount = ParseAmount(total_fee);
            Session["merchan"] = merchan;
            Session["amount"] = amount;
            Session["oid"] = out_trade_no;
            Session["url"] = return_url;
            Session["remarks"] = subject + " " + body;

            Response.Redirect("PayPage.aspx");
        }
    }
}
