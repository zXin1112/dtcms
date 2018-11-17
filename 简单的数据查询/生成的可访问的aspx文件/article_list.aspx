<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_list" ValidateRequest="false" %>
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
	const int pagesize = 20;

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title></title>\r\n</head>\r\n<body>\r\n    ");
	DataTable articlesList = get_article_list(channel,Int32.Parse(DTRequest.GetString("category_id")) , pagesize, page, "status=0", out totalcount, out pagelist, "article_list",  "__id__");

	foreach(DataRow dr in articlesList.Rows)
	{

	templateBuilder.Append("\r\n    <p>\r\n        <a href=\"");
	templateBuilder.Append(linkurl("article_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n        <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" width=\"50px\">\r\n    </p>\r\n   \r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
