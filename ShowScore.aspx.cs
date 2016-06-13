using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPxLabelScoreInfo.Text = "答对：" + Session["RightQuestion"] + "题   答错：" + Session["WrongQuestion"] +
            "题   漏答：" + Session["NotDoneQuestion"] + "题   分数：" + Session["Score"]+ "分   用时："+Session["usedTime"];
    }
    protected void ASPxButtonAgain_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowQuestionSimulation.aspx'</script>");
    }
    protected void ASPxButtonLeave_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ChooseTestModel.aspx'</script>");
    }
}