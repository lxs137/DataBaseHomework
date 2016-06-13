<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowQuestionSimulation.aspx.cs" Inherits="ShowQuestion" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxRichEdit.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRichEdit" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>

<%@ Register assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpreadsheet.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpreadsheet" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        var leftTimeMiunutes;
        var leftTimeSeconds;
        function endTest()
        {
            "<%=timeGone()%>";
        }
        function initTime()
        {
            leftTimeMiunutes = 45;
            leftTimeSeconds = 0;
        }
        function setTime() {
            leftTimeSeconds = leftTimeSeconds - 1;
            if (leftTimeSeconds < 0) {
                leftTimeMiunutes = leftTimeMiunutes - 1;
                leftTimeSeconds = 59;
            }
            if (leftTimeMiunutes <= 9) leftTimeMiunutes = "0" + leftTimeMiunutes;
            if (leftTimeSeconds <= 9) leftTimeSeconds = "0" + leftTimeSeconds;
            if (leftTimeMiunutes == 0 && leftTimeSeconds ==1)
            {
                endTest();
                window.alert("时间到了");
                window.location("http://localhost:54521/Test.aspx");
            }
            else
            {
                document.getElementById("t_m").innerHTML = leftTimeMiunutes + "分";
                document.getElementById("t_s").innerHTML = leftTimeSeconds + "秒";
                document.getElementById("usedtime").value = (44 - leftTimeMiunutes)+"分" + (60 - leftTimeSeconds)+"秒";
            }            
        }        
        setInterval(setTime, 1000);
    </script>
    </head>
<body onload="initTime()">
    <form id="form1" runat="server">    
        <div style="width:1200px;height:400px;float:left;overflow:hidden">
            <div  style="width:250px;height:400px;float:left;margin-left:30px; overflow:hidden">
                <dx:ASPxRoundPanel 
                    ID="RoundPanel_TestName" runat="server" 
                    Width="250px" EnableTheming="True" Height="50px" 
                    Theme="SoftOrange" View="GroupBox" HeaderText="考试信息">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxLabel ID="ASPxLabelTestName" runat="server" style="margin-left:60px"
                                Text="全真模拟" Theme="SoftOrange" Font-Size="20px">
                            </dx:ASPxLabel>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                <div style="width:50px;height:15px;float:left;overflow:hidden"></div>
                    <dx:ASPxRoundPanel
                        ID="RoundPanel_PeopleInfo" runat="server"
                        Width="250px" EnableTheming="true"  Height="230px" 
                        Theme="SoftOrange" View="GroupBox" HeaderText="考生信息">
                        <PanelCollection>
                            <dx:PanelContent>
                                <div style="width:120px;height:120px;margin-left:50px">
                                    <asp:Image ID="HeadImage" runat="server" ImageUrl="/headImage.png"/>
                                </div>
                                <div style="width:200px;height:40px;margin-left:10px">
                                    <dx:ASPxLabel ID="ASPxLabelPeopleInfo1" runat="server" Text="ASPxLabel"  Font-Size="20px"></dx:ASPxLabel>
                                </div>
                                <div style="width:200px;height:40px;margin-left:10px">
                                    <dx:ASPxLabel ID="ASPxLabelPeopleInfo4" runat="server" Text="合格标准：90分合格" Font-Size="20px"></dx:ASPxLabel>
                                </div>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                <div style="width:50px;height:15px;float:left;overflow:hidden"></div>
                <dx:ASPxRoundPanel
                    ID="RoundPanel_TimeLeft" runat="server"
                    Width="250px" EnableTheming="true" Height="80px"
                    Theme="SoftOrange" View="GroupBox" HeaderText="剩余时间">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <span id="t_m" style="font-family: '萝莉体 第二版'; font-size: 35px;margin-left:30px">45分</span> 
                            <span id="t_s" style="font-family: '萝莉体 第二版'; font-size: 35px">00秒</span>                                                      
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </div>
            <input id="usedtime" runat="server" type="hidden" />
            <div style="width:30px;height:400px;float:left"></div> 
            <div style="width:850px;height:400px;float:left">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>                      
                <asp:UpdatePanel ID="UpdatePanelQuestion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <dx:ASPxRoundPanel
                        ID="RoundPanel_QuestionContent" runat="server"
                        Width="850px" EnableTheming="True" Height="297px"
                        Theme="SoftOrange" View="GroupBox" HeaderText="考试题目">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <div style="width:400px;height:265px; float:left">
                                    <dx:ASPxLabel ID="ASPxLabelQuestionContent" runat="server" Text="ASPxLabel" Theme="iOS" Font-Size="Large" RightToLeft="False" Height="50px">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxRadioButton ID="ASPxRadioButtonItem1" runat="server" Theme="Moderno" GroupName="Item" >
                                    </dx:ASPxRadioButton>
                                    <br />
                                    <dx:ASPxRadioButton ID="ASPxRadioButtonItem2" runat="server" Theme="Moderno" GroupName="Item">
                                    </dx:ASPxRadioButton>
                                    <br />
                                    <dx:ASPxRadioButton ID="ASPxRadioButtonItem3" runat="server" Theme="Moderno" GroupName="Item">
                                    </dx:ASPxRadioButton>
                                    <br />
                                    <dx:ASPxRadioButton ID="ASPxRadioButtonItem4" runat="server" Theme="Moderno" GroupName="Item">
                                    </dx:ASPxRadioButton>
                                </div>
                                <div style="width:30px;height:265px;float:left"></div>
                                <div style="width:330px;height:240px;float:left;margin-top:20px">
                                    <asp:Image ID="ImageQuestion" runat="server" 
                                        Height="220px" Width="350px" 
                                        ImageUrl="http://images.juheapi.com/jztk/c1c2subject1/1031.jpg"  />
                                </div>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonNext" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonBefore" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonDone" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton1" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton2" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton3" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton4" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton5" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton6" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton7" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton8" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton9" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton10" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton11" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton12" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton13" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton14" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton15" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton16" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton17" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton18" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton19" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton20" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton21" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton22" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton23" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton24" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton25" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton26" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton27" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton28" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton29" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton30" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton31" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton32" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton33" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton34" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton35" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton36" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton37" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton38" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton39" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton40" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton41" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton42" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton43" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton44" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton45" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton46" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton47" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton48" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton49" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton50" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton51" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton52" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton53" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton54" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton55" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton56" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton57" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton58" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton59" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton60" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton61" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton62" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton63" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton64" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton65" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton66" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton67" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton68" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton69" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton70" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton71" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton72" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton73" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton74" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton75" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton76" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton77" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton78" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton79" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton80" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton81" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton82" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton83" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton84" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton85" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton86" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton87" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton88" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton89" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton90" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton91" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton92" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton93" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton94" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton95" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton96" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton97" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton98" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton99" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton100" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                              
                <div style="width:790px;height:8px;float:left"></div>
                <div style="width:850px; height:80px;float:left">
                    <div style="width:390px;height:80px;float:left">
                        <dx:ASPxRoundPanel
                            ID="RoundPanel_QuestionInfo" runat="server"
                            Width="380px" EnableTheming="true" Height="80px"
                            Theme="SoftOrange" View="GroupBox" HeaderText="考题信息">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div style="width:10px;height:40px;float:left"></div>
                                    <asp:UpdatePanel ID="UpdatePanelInfo" runat="server">
                                        <ContentTemplate>
                                            <div style="width:320px;height:40px;float:left">
                                                <asp:Label ID="LabelQuestionInfo" runat="server" Text="Label" Font-Bold="False" Font-Names="新蒂小丸子" Font-Size="20px"></asp:Label>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ASPxButtonNext" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="ASPxButtonBefore" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <div style="width:10px;height:40px;float:left"></div>                               
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </div>     
                    <div style="width:10px;height:40px;float:left"></div>               
                    <div style="width:130px;height:60px;float:left">
                        <br />
                        <dx:ASPxButton ID="ASPxButtonNext" runat="server" Text="下一题" Theme="Moderno" OnClick="ASPxButtonNext_Click" 
                            Height="45px" Width="130px" AutoPostBack="false">
                        </dx:ASPxButton>
                    </div>
                    <div style="width:30px;height:40px;float:left"></div>
                    <div style="width:130px;height:60px;float:left">
                        <br />
                        <dx:ASPxButton ID="ASPxButtonBefore" runat="server" Text="上一题" Theme="Moderno" OnClick="ASPxButtonBefore_OnClick"
                             Height="45px" Width="130px" AutoPostBack="false">
                        </dx:ASPxButton>
                    </div>
                    <div style="width:30px;height:40px;float:left"></div>
                    <div style="width:130px;height:60px;float:left">
                        <br />
                        <dx:ASPxButton ID="ASPxButtonDone" runat="server" Text="提交试卷" Theme="Moderno"
                             Height="45px" Width="130px" AutoPostBack="False" >
                            <ClientSideEvents Click="function(s, e) {PopupControlDialog.Show();return false;}" />                                 
                        </dx:ASPxButton>
                    </div>
                </div>
            </div>
        </div>
        
        <div style="width:1200px;height:20px"></div>
        <div style="width:1200px;height:300px; margin-left: 100px;">
        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <ContentTemplate>           
            <asp:Table ID="Table1" runat="server" >
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="01" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton1_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="02" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton2_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="03" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton3_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="04" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton4_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="05" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton5_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton6" runat="server" Text="06" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton6_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton7" runat="server" Text="07" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton7_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton8" runat="server" Text="08" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton8_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton9" runat="server" Text="09" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton9_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton10" runat="server" Text="10" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton10_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton11" runat="server" Text="11" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton11_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton12" runat="server" Text="12" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton12_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton13" runat="server" Text="13" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton13_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton14" runat="server" Text="14" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton14_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton15" runat="server" Text="15" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton15_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton16" runat="server" Text="16" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton16_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton17" runat="server" Text="17" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton17_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton18" runat="server" Text="18" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton18_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton19" runat="server" Text="19" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton19_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton20" runat="server" Text="20" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton20_Click"></dx:ASPxButton>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton21" runat="server" Text="21" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton21_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton22" runat="server" Text="22" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton22_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton23" runat="server" Text="23" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton23_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton24" runat="server" Text="24" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton24_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton25" runat="server" Text="25" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton25_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton26" runat="server" Text="26" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton26_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton27" runat="server" Text="27" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton27_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton28" runat="server" Text="28" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton28_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton29" runat="server" Text="29" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton29_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton30" runat="server" Text="30" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton30_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton31" runat="server" Text="31" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton31_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton32" runat="server" Text="32" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton32_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton33" runat="server" Text="33" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton33_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton34" runat="server" Text="34" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton34_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton35" runat="server" Text="35" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton35_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton36" runat="server" Text="36" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton36_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton37" runat="server" Text="37" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton37_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton38" runat="server" Text="38" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton38_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton39" runat="server" Text="39" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton39_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton40" runat="server" Text="40" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton40_Click"></dx:ASPxButton>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton41" runat="server" Text="41" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton41_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton42" runat="server" Text="42" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton42_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton43" runat="server" Text="43" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton43_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton44" runat="server" Text="44" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton44_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton45" runat="server" Text="45" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton45_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton46" runat="server" Text="46" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton46_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton47" runat="server" Text="47" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton47_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton48" runat="server" Text="48" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton48_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton49" runat="server" Text="49" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton49_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton50" runat="server" Text="50" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton50_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton51" runat="server" Text="51" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton51_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton52" runat="server" Text="52" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton52_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton53" runat="server" Text="53" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton53_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton54" runat="server" Text="54" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton54_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton55" runat="server" Text="55" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton55_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton56" runat="server" Text="56" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton56_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton57" runat="server" Text="57" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton57_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton58" runat="server" Text="58" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton58_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton59" runat="server" Text="59" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton59_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton60" runat="server" Text="60" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton60_Click"></dx:ASPxButton>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton61" runat="server" Text="61" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton61_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton62" runat="server" Text="62" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton62_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton63" runat="server" Text="63" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton63_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton64" runat="server" Text="64" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton64_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton65" runat="server" Text="65" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton65_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton66" runat="server" Text="66" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton66_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton67" runat="server" Text="67" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton67_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton68" runat="server" Text="68" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton68_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton69" runat="server" Text="69" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton69_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton70" runat="server" Text="70" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton70_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton71" runat="server" Text="71" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton71_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton72" runat="server" Text="72" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton72_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton73" runat="server" Text="73" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton73_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton74" runat="server" Text="74" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton74_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton75" runat="server" Text="75" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton75_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton76" runat="server" Text="76" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton76_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton77" runat="server" Text="77" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton77_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton78" runat="server" Text="78" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton78_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton79" runat="server" Text="79" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton79_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton80" runat="server" Text="80" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton80_Click"></dx:ASPxButton>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton81" runat="server" Text="81" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton81_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton82" runat="server" Text="82" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton82_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton83" runat="server" Text="83" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton83_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton84" runat="server" Text="84" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton84_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton85" runat="server" Text="85" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton85_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton86" runat="server" Text="86" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton86_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton87" runat="server" Text="87" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton87_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton88" runat="server" Text="88" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton88_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton89" runat="server" Text="89" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton89_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton90" runat="server" Text="90" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton90_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton91" runat="server" Text="91" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton91_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton92" runat="server" Text="92" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton92_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton93" runat="server" Text="93" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton93_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton94" runat="server" Text="94" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton94_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton95" runat="server" Text="95" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton95_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton96" runat="server" Text="96" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton96_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton97" runat="server" Text="97" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton97_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton98" runat="server" Text="98" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton98_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton99" runat="server" Text="99" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton99_Click"></dx:ASPxButton>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Height="50px" Width="50px">
                        <dx:ASPxButton ID="ASPxButton100" runat="server" Text="100" Theme="MetropolisBlue" AutoPostBack="false" OnClick="ASPxButton100_Click"></dx:ASPxButton>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </ContentTemplate>
            <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonNext" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonBefore" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButtonDone" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton1" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton2" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton3" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton4" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton5" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton6" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton7" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton8" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton9" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton10" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton11" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton12" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton13" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton14" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton15" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton16" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton17" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton18" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton19" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton20" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton21" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton22" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton23" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton24" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton25" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton26" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton27" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton28" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton29" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton30" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton31" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton32" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton33" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton34" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton35" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton36" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton37" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton38" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton39" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton40" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton41" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton42" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton43" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton44" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton45" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton46" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton47" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton48" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton49" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton50" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton51" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton52" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton53" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton54" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton55" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton56" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton57" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton58" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton59" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton60" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton61" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton62" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton63" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton64" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton65" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton66" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton67" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton68" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton69" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton70" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton71" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton72" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton73" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton74" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton75" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton76" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton77" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton78" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton79" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton80" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton81" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton82" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton83" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton84" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton85" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton86" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton87" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton88" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton89" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton90" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton91" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton92" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton93" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton94" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton95" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton96" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton97" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton98" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton99" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ASPxButton100" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
    <asp:Button ID="ButtonTimeGone" runat="server" Text=""  Height="0px" Width="0px" 
        Visible="False" OnClick="ButtonTimeGone_Click"/>               
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="PopupControlDialog" 
            PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Height="130px" Width="270px" 
            PopupAnimationType="None" ShowCloseButton="False" CloseAction="None" Theme="Moderno" AppearAfter="100" HeaderText="">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxLabel runat="server" Height="45px" Width="250px" Theme="MetropolisBlue"
                        Text="考试时间还未到，是否要结束考试？" Font-Size="15px">
                    </dx:ASPxLabel>
                    <div style="width:220px;height:35px;margin-left:5px">
                        <div style="width:95px;height:30px;float:left">
                            <dx:ASPxButton ID="ASPxButtonLeaveExam" runat="server" OnClick="ButtonTimeGone_Click"
                                Height="30px" Text="结束考试" Width="90px" AutoPostBack="false" Theme="Moderno" Font-Size="15px">                                                                                            
                                <ClientSideEvents Click="function(s, e) {endTest();}" />                                                                                           
                            </dx:ASPxButton>
                        </div>
                        <div style="width:30px;height:35px;float:left"></div>
                        <div style="width:95px;height:35px;float:left">
                            <dx:ASPxButton ID="ASPxButtonCloseDialog" runat="server"
                                Height="30px" Text="继续考试" Width="90px" AutoPostBack="false" Theme="Moderno" Font-Size="15px" >
                                <ClientSideEvents Click="function(s, e) {PopupControlDialog.Hide();return false;}" />
                            </dx:ASPxButton>
                        </div>                      
                    </div>                   
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        
        </form>

</body>
</html>
