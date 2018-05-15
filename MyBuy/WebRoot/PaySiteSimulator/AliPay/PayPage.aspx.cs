using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RuPeng.Utils;
using PaySiteSimulator.AliPay.DataSetAliPayTableAdapters;

namespace PaySiteSimulator.AliPay
{
    public partial class PayPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var merch = Session["merchan"] as PaySiteSimulator.AliPay.DataSetAliPay.MerchanRow;
                int mid = merch.Id;
                decimal amount = (decimal)Session["amount"];
                string oid = (string)Session["oid"];
                string url = (string)Session["url"];
                string remarks = (string)Session["remarks"];
                litMerch.Text = merch.MerchName;
                litAmount.Text = amount.ToString();
                litOid.Text = oid;
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            var merch = Session["merchan"] as PaySiteSimulator.AliPay.DataSetAliPay.MerchanRow;
            int mid = merch.Id;
            decimal total_fee = (decimal)Session["amount"];
            string oid = (string)Session["oid"];
            string remarks = Session["remarks"] as string;

            new OrderRecordTableAdapter().Insert(mid, DateTime.Now, 0, total_fee, oid, remarks);
            string returncode = "ok";
            string key = merch.MerchKey;
            string md5str = (oid + returncode + total_fee + key).GetMD5();
            string callbackquerystring = string.Format("out_trade_no={0}&returncode={1}&total_fee={2}&sign={3}", oid, returncode, total_fee, md5str);
            Session["callbackquerystring"] = callbackquerystring;
            Response.Redirect("~/PayResult.aspx");
        }
    }
}
