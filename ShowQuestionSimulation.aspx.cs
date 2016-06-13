using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class ShowQuestion : System.Web.UI.Page
{
    static Boolean[] questionScore;
    static List<int> wrongID;
    static int[] yourAnswer;
    static QuestionDataBase questionData;
    static int questionNum;
    static int currentQuestionIndex;
    static User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            String userName=(String)Session["userName"];
            questionNum = 100;
            currentQuestionIndex = 1;
            wrongID = new List<int>();
            user = new User(userName);
            questionScore = new Boolean[questionNum];
            yourAnswer = new int[questionNum];
            user.startTestSimulation("c1_1Questions");
            questionData = user.getTest().getQuestionDataInstance();
            showQuestion();
            showQuestionInfo();
            ASPxLabelPeopleInfo1.Text = "考生姓名：" + userName;
        }
    }
    protected void ASPxButtonNext_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex++;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButtonBefore_OnClick(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex--;
        showQuestion();
        showQuestionInfo();
    }
    protected void ButtonTimeGone_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ShowScore.aspx'</script>");
    }
    protected String timeGone()
    {
        int rightNum=0;
        int wrongNum=0;
        int notDoneNum=0;
        foreach(int temp in yourAnswer)
            if(temp==0) notDoneNum++;
        foreach(Boolean temp in questionScore)
            if(temp) rightNum++;
        wrongNum=100-notDoneNum-rightNum;
       
        Session["RightQuestion"]=rightNum;
        Session["WrongQuestion"]=wrongNum;
        Session["NotDoneQuestion"]=notDoneNum;
        Session["Score"] = rightNum;
        Session["usedTime"]=usedtime.Value;
        storeWrongQuestion(usedtime.Value,rightNum);
        return "0";
    }
    private void storeWrongQuestion(String usedTime,int score)
    {
        user.increaseWrongQuestion(wrongID.ToArray());
        String wrongStr = "";
        foreach(int temp in wrongID)
        {
            wrongStr += temp + ",";
        }
        if(!usedTime.Equals(""))
            new DataBaseConnectHelper().insertTestHistory(user.getUserName(), wrongStr,usedTime, "c1_1",score);
        user.storeWrongQuestion("c1_1");
    }
    private void showQuestion()
    {
        if (currentQuestionIndex < 1) currentQuestionIndex = 1;
        else if (currentQuestionIndex > questionNum) currentQuestionIndex = questionNum;
        ASPxLabelQuestionContent.Text = questionData.getQuestion(currentQuestionIndex).getQuestion();
        ASPxRadioButtonItem1.Text = questionData.getQuestion(currentQuestionIndex).getItem(1);
        ASPxRadioButtonItem2.Text = questionData.getQuestion(currentQuestionIndex).getItem(2);
        ASPxRadioButtonItem3.Text = questionData.getQuestion(currentQuestionIndex).getItem(3);
        ASPxRadioButtonItem4.Text = questionData.getQuestion(currentQuestionIndex).getItem(4);
        if (ASPxRadioButtonItem3.Text.Equals("")) ASPxRadioButtonItem3.Visible = false;
        else ASPxRadioButtonItem3.Visible = true;
        if (ASPxRadioButtonItem4.Text.Equals("")) ASPxRadioButtonItem4.Visible = false;
        else ASPxRadioButtonItem4.Visible = true;
        ImageQuestion.ImageUrl = questionData.getQuestion(currentQuestionIndex).getUrl();
        ASPxRadioButtonItem1.Checked = false;
        ASPxRadioButtonItem2.Checked = false;
        ASPxRadioButtonItem3.Checked = false;
        ASPxRadioButtonItem4.Checked = false;
        if (yourAnswer[currentQuestionIndex - 1] != 0)
        {
            switch (yourAnswer[currentQuestionIndex - 1])
            {
                case 1: ASPxRadioButtonItem1.Checked = true; break;
                case 2: ASPxRadioButtonItem2.Checked = true; break;
                case 3: ASPxRadioButtonItem3.Checked = true; break;
                case 4: ASPxRadioButtonItem4.Checked = true; break;
            }
            ASPxRadioButtonItem1.Enabled = false;
            ASPxRadioButtonItem2.Enabled = false;
            ASPxRadioButtonItem3.Enabled = false;
            ASPxRadioButtonItem4.Enabled = false;
        }
        else
        {
            ASPxRadioButtonItem1.Enabled = true;
            ASPxRadioButtonItem2.Enabled = true;
            ASPxRadioButtonItem3.Enabled = true;
            ASPxRadioButtonItem4.Enabled = true;
        }
    }
    private void showQuestionInfo()
    {
        if (ASPxRadioButtonItem3.Text.Equals("")) LabelQuestionInfo.Text = "判断题，请判断对错！";
        else LabelQuestionInfo.Text = "单选题，请选择你认为正确的答案";
    }
    private void checkQuestion()
    {
        if(ASPxRadioButtonItem1.Checked==true) yourAnswer[currentQuestionIndex-1]=1;
        else if(ASPxRadioButtonItem2.Checked==true) yourAnswer[currentQuestionIndex-1]=2;
        else if(ASPxRadioButtonItem3.Checked==true) yourAnswer[currentQuestionIndex-1]=3;
        else if(ASPxRadioButtonItem4.Checked==true) yourAnswer[currentQuestionIndex-1]=4;
        else yourAnswer[currentQuestionIndex-1]=0;
        if (questionData.getQuestion(currentQuestionIndex).checkAnswer(yourAnswer[currentQuestionIndex-1])) 
            questionScore[currentQuestionIndex - 1] = true;
        else questionScore[currentQuestionIndex - 1] = false;
        ASPxButton currentButton=(ASPxButton)this.FindControl("ASPxButton" + currentQuestionIndex);
        if (yourAnswer[currentQuestionIndex - 1] != 0)
        {
            if (questionScore[currentQuestionIndex - 1]) currentButton.BackColor = System.Drawing.Color.LightGreen;
            else
            {
                currentButton.BackColor = System.Drawing.Color.Red;
                wrongID.Add(questionData.getQuestion(currentQuestionIndex).getID());
            }
        }
    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 1;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 2;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton3_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 3;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton4_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 4;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton5_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 5;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton6_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 6;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton7_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 7;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton8_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 8;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton9_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 9;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton10_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 10;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton11_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 11;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton12_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 12;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton13_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 13;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton14_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 14;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton15_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 15;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton16_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 16;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton17_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 17;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton18_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 18;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton19_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 19;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton20_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 20;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton21_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 21;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton22_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 22;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton23_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 23;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton24_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 24;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton25_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 25;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton26_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 26;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton27_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 27;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton28_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 28;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton29_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 29;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton30_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 30;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton31_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 31;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton32_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 32;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton33_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 33;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton34_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 34;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton35_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 35;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton36_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 36;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton37_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 37;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton38_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 38;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton39_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 39;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton40_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 40;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton41_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 41;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton42_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 42;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton43_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 43;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton44_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 44;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton45_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 45;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton46_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 46;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton47_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 47;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton48_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 48;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton49_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 49;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton50_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 50;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton51_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 51;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton52_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 52;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton53_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 53;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton54_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 54;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton55_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 55;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton56_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 56;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton57_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 57;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton58_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 58;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton59_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 59;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton60_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 60;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton61_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 61;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton62_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 62;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton63_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 63;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton64_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 64;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton65_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 65;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton66_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 66;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton67_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 67;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton68_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 68;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton69_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 69;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton70_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 70;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton71_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 71;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton72_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 72;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton73_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 73;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton74_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 74;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton75_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 75;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton76_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 76;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton77_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 77;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton78_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 78;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton79_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 79;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton80_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 80;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton81_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 81;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton82_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 82;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton83_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 83;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton84_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 84;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton85_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 85;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton86_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 86;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton87_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 87;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton88_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 88;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton89_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 89;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton90_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 90;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton91_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 91;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton92_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 92;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton93_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 93;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton94_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 94;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton95_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 95;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton96_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 96;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton97_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 97;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton98_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 98;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton99_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 99;
        showQuestion();
        showQuestionInfo();
    }
    protected void ASPxButton100_Click(object sender, EventArgs e)
    {
        checkQuestion();
        currentQuestionIndex = 100;
        showQuestion();
        showQuestionInfo();
    }

    
}