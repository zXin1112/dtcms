<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title></title>\r\n</head>\r\n<body>\r\n    ");
	DataTable dt = get_category_child_list("article",0 );

	templateBuilder.Append("\r\n    <ul>\r\n        ");
	foreach(DataRow dr in dt.Rows)
	{

	templateBuilder.Append("\r\n        <li>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("article_list",Int32.Parse(Utils.ObjectToStr(dr["id"]))));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n    </ul>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
