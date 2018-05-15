using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PaySiteSimulator.AliPay.DataSetAliPayTableAdapters;

namespace PaySiteSimulator.AliPay
{
    public partial class MD5Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MerchanTableAdapter adapter = new MerchanTableAdapter();
                var data = adapter.GetDataById(Convert.ToInt32(Request["id"]));
                txtkey.Text = data.Single().MerchKey;
                labelName.Text = data.Single().MerchName;
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            MerchanTableAdapter adapter = new MerchanTableAdapter();
            adapter.UpdateKeyById(txtkey.Text, Convert.ToInt32(Request["id"]));
            ClientScript.RegisterStartupScript(GetType(),
                    "alert", "alert('修改成功！')", true);
        }
    }
}