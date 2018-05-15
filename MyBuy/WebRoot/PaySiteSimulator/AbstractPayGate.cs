using System;
using System.Web;
using System.Web.SessionState;
using RuPeng.Utils;

namespace PaySiteSimulator
{
    public abstract class AbstractPayGate : IHttpHandler, IRequiresSessionState
    {
        protected HttpRequest Request { get; set; }
        protected HttpResponse Response { get; set; }
        protected HttpSessionState Session { get; set; }
        #region IHttpHandler Members

        public bool IsReusable
        {
            get { return false; }//因为缓存了Request、Response，所以不能reuse
        }
        public virtual void ProcessRequest(HttpContext context)
        {
            Request = context.Request;
            Response = context.Response;
            Session = context.Session;
            Response.ContentType = "text/html";
        }
        #endregion

        protected string GetNotNullValue(string paramName)
        {
            string value = Request[paramName];
            if (string.IsNullOrEmpty(value))
            {
                ErrorEnd("请求错误，这是您的商户程序集成错误，请向你的商户汇报如下错误：" + paramName + "不能为空");
            }
            return value;
        }

        protected void ErrorEnd(string msg)
        {
            Response.Write(msg);
            Response.End();
        }

        /// <summary>
        /// 校验MD5是否正确
        /// </summary>
        /// <param name="requestMD5">用户请求来的MD5</param>
        /// <param name="source"></param>
        protected void CheckMD5(string requestMD5, string source)
        {
            if (source.GetMD5() != requestMD5)
            {
                Response.Write(source);
                ErrorEnd("MD5数据校验错误，请联系商家");
            }
        }

        protected decimal ParseAmount(string amount)
        {
            decimal d=0;
            if (decimal.TryParse(amount, out d) == false)
            {
                ErrorEnd("不是合法的金额");
            }
            return d;
        }
    }
}
