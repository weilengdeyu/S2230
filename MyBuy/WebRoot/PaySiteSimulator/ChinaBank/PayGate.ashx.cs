using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using PaySiteSimulator.ChinaBank.DataSetChinaBankTableAdapters;

namespace PaySiteSimulator.ChinaBank
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
            string v_mid = GetNotNullValue("v_mid");
            string v_oid = GetNotNullValue("v_oid");
            string v_amount = GetNotNullValue("v_amount");
            string v_moneytype = GetNotNullValue("v_moneytype");
            string v_url = GetNotNullValue("v_url");
            string v_md5info = GetNotNullValue("v_md5info");            
            string style = GetNotNullValue("style");//网关模式0(普通列表)，2(银行列表中带外卡)
            string remark1 = Request["remark1"];
            string remark2 = Request["remark2"];

            var merchans = new MerchanTableAdapter().GetDataByMerchNumber(v_mid);
            if (merchans.Count <= 0)
            {
                Response.Write("错误的商户编号");
                Response.End();
                return;
            }
            var merchan = merchans.Single();
            string key = merchan.MerchKey;//取出商户设置的key
            string md5Src = v_amount+v_moneytype+v_oid+v_mid+key;
            CheckMD5(v_md5info, md5Src);

            decimal amount = ParseAmount(v_amount);
            Session["merchan"] = merchan;
            Session["amount"] = amount;
            Session["oid"] = v_oid;
            Session["url"] = v_url;
            Session["remark1"] = remark1;
            Session["remark2"] = remark2;

            Response.Redirect("PayPage.aspx");
        }
    }
}
