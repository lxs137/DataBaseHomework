<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowQuestionAllOrder.aspx.cs" Inherits="ShowQuestionAllOrder" %>
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
        function initTime() {
            leftTimeMiunutes = 0;
            leftTimeSeconds = 0;
        }
        function setTime() {
            leftTimeSeconds = leftTimeSeconds + 1;
            if (leftTimeSeconds >= 60) {
                leftTimeMiunutes = leftTimeMiunutes + 1;
                leftTimeSeconds = 0;
            }
            document.getElementById("t_m").innerHTML = leftTimeMiunutes + "分";
            document.getElementById("t_s").innerHTML = leftTimeSeconds + "秒";
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
                                Text="顺序练习" Theme="SoftOrange" Font-Size="20px">
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
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                <div style="width:50px;height:15px;float:left;overflow:hidden"></div>
                <dx:ASPxRoundPanel
                    ID="RoundPanel_TimeLeft" runat="server"
                    Width="250px" EnableTheming="true" Height="80px"
                    Theme="SoftOrange" View="GroupBox" HeaderText="做题时间">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <span id="t_m" style="font-family: '萝莉体 第二版'; font-size: 35px;margin-left:30px">0分</span> 
                            <span id="t_s" style="font-family: '萝莉体 第二版'; font-size: 35px">0秒</span>                          
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </div>
            
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
                                    <dx:ASPxRadioButton ID="ASPxRadioButtonItem1" runat="server" Theme="Moderno" GroupName="Item">
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
                        <dx:ASPxButton ID="ASPxButtonDone" runat="server" Text="结束考试" Theme="Moderno"  OnClick="ASPxButtonDone_OnClick"
                             Height="45px" Width="130px" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {PopupControlDialog.Show();return false;}" />                                 
                        </dx:ASPxButton>
                    </div>
                </div>
            </div>
        </div>
        <div style="width:1200px;height:130px;margin-left:30px;float:left">
            <div style="width:920px;height:125px;float:left">
            <dx:ASPxRoundPanel
                ID="ASPxRoundPanelQuestionExplain" runat="server"
                Width="900px" EnableTheming="true" Height="120px"
                Theme="SoftOrange" View="GroupBox" HeaderText="考题详解">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div style="width:30px;height:40px;float:left"></div>
                        <asp:UpdatePanel ID="UpdatePanelQuestionExplain" runat="server">
                            <ContentTemplate>
                                <div style="width:850px;height:30px">
                                    <dx:ASPxLabel ID="LabelQuestionAnswer" runat="server" Font-Bold="True" Font-Names="新蒂小丸子" Font-Size="25px" ForeColor="#33CC33"></dx:ASPxLabel>
                                </div>
                                <div style="width:850px;height:90px">        
                                    <asp:Label ID="LabelQuestionExplain" runat="server" Text="Label" Font-Bold="False" Font-Names="新蒂小丸子" Font-Size="25px"></asp:Label>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ASPxButtonNext" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="ASPxButtonBefore" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="ASPxButtonShowAnswer" EventName="Click" />
                            </Triggers>
                            </asp:UpdatePanel>
                       <div style="width:50px;height:40px;float:left"></div>                               
                       </dx:PanelContent>
                    </PanelCollection>
                 </dx:ASPxRoundPanel>
            </div>
            <div style="width:80px;height:50px;float:left"></div>
            <div style="width:130px;height:60px;float:left">
                <br />
                <dx:ASPxButton ID="ASPxButtonShowAnswer" runat="server" Text="查看答案" Theme="Moderno"  OnClick="ASPxButtonShowAnswer_Click"
                    Height="45px" Width="130px" AutoPostBack="False">                                 
                </dx:ASPxButton>
            </div>
        </div>
                      
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="PopupControlDialog" 
            PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Height="130px" Width="270px" 
            PopupAnimationType="None" ShowCloseButton="False" CloseAction="None" Theme="Moderno" AppearAfter="100" HeaderText="">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="width:160px;height:45px;float:left;margin-left:50px">
                        <dx:ASPxLabel runat="server" Height="45px" Width="150px" Theme="MetropolisBlue"
                            Text="是否要结束考试？" Font-Size="15px">
                        </dx:ASPxLabel>
                    </div>
                    <div style="width:220px;height:35px">
                        <div style="width:95px;height:30px;float:left">
                            <dx:ASPxButton ID="ASPxButtonLeaveExam" runat="server" OnClick="ASPxButtonLeaveExam_Click"
                                Height="30px" Text="结束考试" Width="90px" AutoPostBack="false" Theme="Moderno" Font-Size="15px">
                                <ClientSideEvents Click="function(s, e) {PopupControlDialog.Hide();return false;}" />
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
