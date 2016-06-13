using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChooseTestModel : System.Web.UI.Page
{
    static String userName; 
    protected void Page_Load(object sender, EventArgs e)
    {
        userName=(String)Session["userName"];
        ASPxLabelUserCity.Text = "所在城市：南京";
        ASPxLabelUserInfo.Text = "用户名：" + userName;
        ASPxLabelUserSchool.Text = "驾校：天宝驾校";
    }
    protected void ASPxButtonSimulationC1_1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionSimulation.aspx'</script>");
    }
    protected void ASPxButtonAllOrderC1_1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionAllOrder.aspx'</script>");
    }
    protected void ASPxButtonAllRandC1_1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionAllRand.aspx'</script>");
    }
    protected void ASPxButtonWrongC1_1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionWrong.aspx'</script>");
    }
    protected void ASPxButtonSimulationC1_4_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionSimulation.aspx'</script>");
    }
    protected void ASPxButtonAllOrderC1_4_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionAllOrder.aspx'</script>");
    }
    protected void ASPxButtonAllRandC1_4_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionAllRand.aspx'</script>");
    }
    protected void ASPxButtonWrongC1_4_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionWrong.aspx'</script>");
    }
}