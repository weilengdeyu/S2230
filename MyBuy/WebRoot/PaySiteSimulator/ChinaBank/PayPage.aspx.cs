using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PaySiteSimulator.ChinaBank.DataSetChinaBankTableAdapters;
using RuPeng.Utils;

namespace PaySiteSimulator.ChinaBank
{
    public partial class PayPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var merch = Session["merchan"] as PaySiteSimulator.ChinaBank.DataSetChinaBank.MerchanRow;
                int mid = merch.Id;
                decimal amount = (decimal)Session["amount"];
                string oid = (string)Session["oid"];
                string url = (string)Session["url"];
                litMerch.Text = merch.MerchName;
                litAmount.Text = amount.ToString();
                litOid.Text = oid;
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            var merch = Session["merchan"] as PaySiteSimulator.ChinaBank.DataSetChinaBank.MerchanRow;
            int mid = merch.Id;
            decimal amount = (decimal)Session["amount"];
            string oid = (string)Session["oid"];

            new OrderRecordTableAdapter().Insert(mid, DateTime.Now, 0, oid, amount);
            string pstatus="20";
            string moneytype="0";
            string key = merch.MerchKey;
            string remark1 = Session["remark1"] as string;
            string remark2 = Session["remark2"] as string;
            string md5str = (oid+pstatus+amount+moneytype+key).GetMD5();
            string callbackquerystring = string.Format("v_oid={0}&v_pmode={1}&v_pstatus={2}&v_amount={3}&v_moneytype={4}&remark1={5}&remark2={6}&v_md5str={7}",oid,0,pstatus,amount,moneytype,remark1,remark2,md5str);
            Session["callbackquerystring"] = callbackquerystring;
            Response.Redirect("~/PayResult.aspx");
        }
    }
}
