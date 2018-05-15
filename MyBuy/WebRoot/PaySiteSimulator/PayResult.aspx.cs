using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace PaySiteSimulator
{
    public partial class PayResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Session["url"] as string;
            string callbackquerystring = Session["callbackquerystring"] as string;
            HtmlMeta meta = new HtmlMeta();
            meta.HttpEquiv="refresh";

            string redirectUrl = "";
            if (url.Contains("?") && url.Contains("="))//如果返回的服务器url中含有?和=，则说明url中已经含有键值对，所以添加&进行连接
            {
                redirectUrl = url + "&" + callbackquerystring;
            }
            else
            {
                redirectUrl = url + "?" + callbackquerystring;//否则说明就是没有连接字符串的，直接添加?后加参数
            }
            meta.Content = string.Format("3;url={0}", redirectUrl);//自动刷新
            Header.Controls.Add(meta);
        }
    }
}
