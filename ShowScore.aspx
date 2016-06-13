<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowScore.aspx.cs" Inherits="ShowScore" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:1200px;height:10px;margin-left:30px"></div>
        <div style="width:1200px;height:80px;margin-left:30px">
            <dx:ASPxRoundPanel ID="ASPxRoundPanelUserInfo" runat="server" ShowCollapseButton="true" 
                Theme="SoftOrange" View="GroupBox" 
                Width="1180px" Height="75px" HeaderText="登陆信息">
            </dx:ASPxRoundPanel>
        </div>
        <div style="width:1200px;height:20px;margin-left:30px"></div>
        <div style="width:1200px;height:600px;margin-left:30px">
            <dx:ASPxRoundPanel Id="ASPxRoundPanelChoose" runat="server" ShowCollapseButton="true"
                Theme="SoftOrange" View="GroupBox" 
                Width="1180px" Height="595px" HeaderText="模式选择" BackColor="#7ED5F6">
                <PanelCollection>
                    <dx:PanelContent>
                        <div style="width:650px;height:510px;float:left;margin-left:300px;margin-top:0px">
                            <dx:ASPxPanel ID="ASPxPanelTestScore" runat="server" Width="645px" Height="545px"
                                BackColor="#7ED5F6" Theme="MetropolisBlue">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <div style="width:500px;height:450px;margin-left:40px">
                                            <asp:Image ID="Image2" runat="server"
                                            ImageUrl="http://web.resource.mucang.cn/jiakaobaodian.web/jkbd-app/resources/css/images/award/result-fail.png" />
                                        </div>
                                        <div style="width:600px;height:40px;margin-left:10px">
                                            <dx:ASPxLabel ID="ASPxLabelScoreInfo" runat="server"
                                                Text="答对：     答错：     分数：       用时：       " Font-Names="新宋体" Font-Size="18px" Font-Bold="True" ForeColor="#FF6600"></dx:ASPxLabel>
                                        </div>
                                        <div style="width:500px;height:70px">
                                            <div style="width:200px;height:60px;float:left;margin-left:60px">
                                                <dx:ASPxButton ID="ASPxButtonAgain" runat="server" Text="再来一次" Theme="Moderno"
                                                    width="180px" Height="50px" Font-Bold="True" Font-Names="宋体" Font-Size="20px" OnClick="ASPxButtonAgain_Click"></dx:ASPxButton>
                                            </div>
                                            <div style="width:40px;height:60px;float:left"></div>
                                            <div style="width:200px;height:60px;float:left">
                                                <dx:ASPxButton ID="ASPxButtonLeave" runat="server" Text="离开考试" Theme="Moderno"
                                                    width="180px" Height="50px" Font-Bold="True" Font-Names="宋体" Font-Size="20px" OnClick="ASPxButtonLeave_Click"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>               
            </dx:ASPxRoundPanel>
        </div>
    </form>
</body>
</html>

