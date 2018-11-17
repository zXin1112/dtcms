<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.index" ValidateRequest="false" %>
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

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title></title>\r\n</head>\r\n<body>\r\n    <header>\r\n        <h1>添加的标题</h1>\r\n        <ul>\r\n            ");
	DataTable dt = get_category_child_list("indexsetting", 0);

	foreach(DataRow dr in dt.Rows)
	{

	templateBuilder.Append("\r\n\r\n            <li>\r\n                二级类别ID：" + Utils.ObjectToStr(dr["id"]) + "\r\n                二级类别名称：" + Utils.ObjectToStr(dr["title"]) + "\r\n\r\n                <ul>\r\n                    ");
	DataTable dt2 = get_category_child_list("indexsetting", Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0));

	foreach(DataRow dr2 in dt2.Rows)
	{

	templateBuilder.Append("\r\n                    <li>\r\n                        三级类别ID：" + Utils.ObjectToStr(dr2["id"]) + "\r\n                        三级类别名称：" + Utils.ObjectToStr(dr2["title"]) + "\r\n                        <ul>\r\n                            ");
	DataTable dt3 = get_category_child_list("indexsetting", Utils.StrToInt(Utils.ObjectToStr(dr2["id"]), 0));

	foreach(DataRow dr3 in dt3.Rows)
	{

	templateBuilder.Append("\r\n                            <li>\r\n                                四级类别ID：" + Utils.ObjectToStr(dr3["id"]) + "\r\n                                四级类别名称：" + Utils.ObjectToStr(dr3["title"]) + "\r\n                            </li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </ul>\r\n                    </li>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </ul>\r\n            </li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n    </header>\r\n    <section>\r\n        ");
	DataTable dtIndexSetting = get_article_list("indexsetting", 1, "status=0");

	templateBuilder.Append("\r\n        <ul>\r\n            ");
	foreach(DataRow drIndexSetting in dtIndexSetting.Rows)
	{

	templateBuilder.Append("\r\n            <li>\r\n                <h1>" + Utils.ObjectToStr(drIndexSetting["title"]) + "</h1>\r\n                <h2>图片：</h2>\r\n                <p><img src=\"" + Utils.ObjectToStr(drIndexSetting["img_url"]) + "\" /></p>\r\n                <p>摘要：" + Utils.ObjectToStr(drIndexSetting["zhaiyao"]) + "</p>\r\n                <p>内容：" + Utils.ObjectToStr(drIndexSetting["content"]) + "</p>\r\n                <span>添加时间：" + Utils.ObjectToStr(drIndexSetting["add_time"]) + "</span>\r\n            </li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n    </section>\r\n    <section>\r\n        <h2>系统配置信息</h2>\r\n        <p>主站名称：");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</p>\r\n        <p>公司名称：");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append("</p>\r\n        <p>公司地址:");
	templateBuilder.Append(Utils.ObjectToStr(config.webaddress));
	templateBuilder.Append("  </p>\r\n        <p> 	管理员邮箱 :");
	templateBuilder.Append(Utils.ObjectToStr(config.webmail));
	templateBuilder.Append(" </p>\r\n    </section>\r\n    <section>\r\n        <h2>站点配置信息</h2>\r\n        <p> 	网站名称 ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append(" </p>\r\n        <p> 	网站域名 ");
	templateBuilder.Append(Utils.ObjectToStr(site.domain));
	templateBuilder.Append(" </p>\r\n        <p> 	公司名称 ");
	templateBuilder.Append(Utils.ObjectToStr(site.company));
	templateBuilder.Append(" </p>\r\n    </section>\r\n    <footer>\r\n        <h2>跳转新闻频道</h2>\r\n        <nav>\r\n            ");
	DataTable dt1 = get_category_child_list("article",0 );

	templateBuilder.Append("\r\n            <ul>\r\n                ");
	foreach(DataRow dr in dt1.Rows)
	{

	templateBuilder.Append("\r\n                <li>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("article_list",Int32.Parse(Utils.ObjectToStr(dr["id"]))));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n                </li>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n            </ul>\r\n        </nav>\r\n    </footer>\r\n    \r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
