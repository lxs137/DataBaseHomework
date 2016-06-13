using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class ShowQuestionAllOrder : System.Web.UI.Page
{
    static Boolean[] questionScore;
    static int[] yourAnswer;
    static QuestionDataBase questionData;
    static int questionNum;
    static int currentQuestionIndex = 1;
    static User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            user = new User("123");
            user.startTestAllOrder("c1_1Questions");
            questionData = user.getTest().getQuestionDataInstance();
            questionNum = questionData.getSize();
            yourAnswer = new int[questionNum];
            questionScore = new Boolean[questionNum];
            showQuestion();
            showQuestionInfo();
            ASPxLabelPeopleInfo1.Text = "考生姓名：" +(String)Session["userName"];
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
    protected void ASPxButtonDone_OnClick(object sender, EventArgs e)
    {
        
    }
    protected void ASPxButtonLeaveExam_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='ChooseTestModel.aspx'</script>");
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
        LabelQuestionExplain.Text = "";
        LabelQuestionAnswer.Text = "";
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
        if (ASPxRadioButtonItem1.Checked == true) yourAnswer[currentQuestionIndex - 1] = 1;
        else if (ASPxRadioButtonItem2.Checked == true) yourAnswer[currentQuestionIndex - 1] = 2;
        else if (ASPxRadioButtonItem3.Checked == true) yourAnswer[currentQuestionIndex - 1] = 3;
        else if (ASPxRadioButtonItem4.Checked == true) yourAnswer[currentQuestionIndex - 1] = 4;
        else yourAnswer[currentQuestionIndex - 1] = 0;
        if (questionData.getQuestion(currentQuestionIndex).checkAnswer(yourAnswer[currentQuestionIndex - 1]))
            questionScore[currentQuestionIndex - 1] = true;
        else questionScore[currentQuestionIndex - 1] = false;
    }
    protected void ASPxButtonShowAnswer_Click(object sender, EventArgs e)
    {
        checkQuestion();
        LabelQuestionExplain.Text = questionData.getQuestion(currentQuestionIndex).getExplains();
        int currentAnswer = questionData.getQuestion(currentQuestionIndex).getAnswer();
        if (yourAnswer[currentQuestionIndex - 1] != 0 && questionScore[currentQuestionIndex - 1] == false)
        {
            LabelQuestionAnswer.Text = "回答错误，正确答案是：" + questionData.getQuestion(currentQuestionIndex).getItem(currentAnswer);
            LabelQuestionAnswer.ForeColor = System.Drawing.Color.Red;
        }
        else if (questionScore[currentQuestionIndex - 1] == true)
        {
            LabelQuestionAnswer.Text = "回答正确，正确答案是：" + questionData.getQuestion(currentQuestionIndex).getItem(currentAnswer);
            LabelQuestionAnswer.ForeColor = System.Drawing.Color.ForestGreen;
        }
        else
        {
            LabelQuestionAnswer.Text = "正确答案是：" + questionData.getQuestion(currentQuestionIndex).getItem(currentAnswer);
            LabelQuestionAnswer.ForeColor = System.Drawing.Color.ForestGreen;
        }
    }
    
}