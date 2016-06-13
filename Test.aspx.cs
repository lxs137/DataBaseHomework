using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    /*    WebConnectHelper webConnect = new WebConnectHelper();
        String strConnect = "";
        while(!webConnect.setConnection())
        {
            TextBox1.Text = "Fall";
        }
        QuestionDataBase questionData=new QuestionDataBase();
        questionData.initBaseFromWeb(webConnect);
        questionData.loadDataIntoSQLBase();
        TextBox1.Text = strConnect;
        DataBaseConnectHelper dataBaseConnect = new DataBaseConnectHelper();
        QuestionDataBase questionData = new QuestionDataBase(100);
        questionData.initBaseFromSQLBase(dataBaseConnect);
        String strConnect = "";
        strConnect += questionData.getQuestion(2).getID()+"\n";
        strConnect += questionData.getQuestion(2).getQuestion()+"\n";
        strConnect += questionData.getQuestion(2).getID() + "\n";
        strConnect += questionData.getQuestion(2).getItem(1) + "\n";
        strConnect += questionData.getQuestion(2).getItem(2) + "\n";
        strConnect += questionData.getQuestion(2).getItem(3) + "\n";
        strConnect += questionData.getQuestion(2).getItem(4) + "\n";
        strConnect += questionData.getQuestion(2).getExplains() + "\n";
        strConnect += questionData.getQuestion(2).getAnswer() + "\n";
       strConnect += questionData.getQuestion(2).getUrl() + "\n";
   
        TextBox1.Text = Session["Score"].ToString() ;
     */   
    }
}