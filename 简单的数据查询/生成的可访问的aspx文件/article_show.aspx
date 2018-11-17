<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2018/11/17 8:32:05.
		本页面代码由DTcms模板引擎生成于 2018/11/17 8:32:05. 
	*/

	base.channel = "article";
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title></title>\r\n</head>\r\n<body>\r\n\r\n    <section>\r\n        \r\n        <ul>\r\n           \r\n            <li>\r\n                <h1>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("</h1>\r\n                <h2>图片：</h2>\r\n                <p><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.img_url));
	templateBuilder.Append("\" /></p>\r\n                <p>摘要：");
	templateBuilder.Append(Utils.ObjectToStr(model.zhaiyao));
	templateBuilder.Append("</p>\r\n                <p>内容：");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("</p>\r\n                <span>添加时间：");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("</span>\r\n            </li>\r\n           \r\n        </ul>\r\n    </section>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
