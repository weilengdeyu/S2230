using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PaySiteSimulator.AliPay.DataSetAliPayTableAdapters;

namespace PaySiteSimulator.AliPay
{
    public partial class MerchanLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            MerchanTableAdapter adapter = new MerchanTableAdapter();
            var data = adapter.GetDataByMerchNum(txtNum.Text);
            if (data.Count <= 0)
            {
                ClientScript.RegisterStartupScript(GetType(),
                    "alert","alert('商户号不存在！')",true);
                return;
            }
            Response.Redirect("MD5Settings.aspx?id="+data.Single().Id);
        }
    }
}