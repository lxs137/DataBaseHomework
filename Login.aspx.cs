using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ASPxButtonLogin_Click(object sender, EventArgs e)
    {
        if (ASPxTextBoxUserName.Text == "lxs" && ASPxTextBoxPassword.Text=="1234")
        {
            Response.Write("<script language = javascript>alert('进入管理员界面！');</script>");
            Response.Write("<script language='javascript'>window.location='ManagerData.aspx'</script>");
        }
        if(new DataBaseConnectHelper().checkUser(ASPxTextBoxUserName.Text,ASPxTextBoxPassword.Text))
        {
            Session["userName"] = ASPxTextBoxUserName.Text;
            Response.Write("<script language='javascript'>window.location='ChooseTestModel.aspx'</script>");
        }
        else
        {
            Response.Write("<script language = javascript>alert('用户名或密码错误！');</script>");
            Response.Write("<script language='javascript'>window.location='Login.aspx'</script>");
        }
    }
    protected void ASPxButtonRegister_Click(object sender, EventArgs e)
    {
        if (!new DataBaseConnectHelper().checkUser(ASPxTextBoxUserName.Text, ASPxTextBoxPassword.Text))
        {
            new DataBaseConnectHelper().addNewUser(ASPxTextBoxUserName.Text, ASPxTextBoxPassword.Text);
            Session["userName"] = ASPxTextBoxUserName.Text;
            Response.Write("<script language = javascript>alert('注册成功！');</script>");
            Response.Write("<script language='javascript'>window.location='ChooseTestModel.aspx'</script>");
        }
        else
        {
            Response.Write("<script language = javascript>alert('用户名已存在！');</script>");
            Response.Write("<script language='javascript'>window.location='Login.aspx'</script>");
        }
    }
}