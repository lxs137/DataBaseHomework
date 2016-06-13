<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseTestModel.aspx.cs" Inherits="ChooseTestModel" %>

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
                <PanelCollection>
                    <dx:PanelContent>
                        <div style="width:250px;height:50px;float:left;margin-left:100px;margin-top:20px">
                            <dx:ASPxLabel ID="ASPxLabelUserCity" runat="server" style="margin-left:60px;margin-top:50px"
                                Text="ASPxLabel" Font-Size="20px"></dx:ASPxLabel>  
                        </div>
                        <div style="width:250px;height:50px;float:left;margin-left:80px;margin-top:20px">
                            <dx:ASPxLabel ID="ASPxLabelUserInfo" runat="server" style="margin-left:60px;margin-top:50px"
                                Text="ASPxLabel" Font-Size="20px"></dx:ASPxLabel>  
                        </div>
                        <div style="width:250px;height:50px;float:left;margin-left:80px;margin-top:20px">
                            <dx:ASPxLabel ID="ASPxLabelUserSchool" runat="server" style="margin-left:60px;margin-top:50px"
                                Text="ASPxLabel" Font-Size="20px"></dx:ASPxLabel>  
                        </div>                                             
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div style="width:1200px;height:20px;margin-left:30px"></div>
        <div style="width:1200px;height:400px;margin-left:30px">
            <dx:ASPxRoundPanel Id="ASPxRoundPanelChoose" runat="server" ShowCollapseButton="true"
                Theme="SoftOrange" View="GroupBox" 
                Width="1180px" Height="395px" HeaderText="模式选择">
                <PanelCollection>
                    <dx:PanelContent>
                        <div style="width:500px;height:300px;float:left;margin-left:50px;margin-top:40px">
                            <dx:ASPxPanel ID="ASPxPanelC1Subject1" runat="server" Width="495px" Height="295px"
                                BackColor="#F1F1F1" Theme="MetropolisBlue">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <div style="width:360px;height:40px;margin-left:70px">
                                            <br />
                                            <br />
                                            <span style="font-family: 宋体; font-size: 24px">南京2016小车c1理论考试 科目一</span>
                                        </div>
                                        <div style="width:300px;height:30px;margin-left:100px">
                                            <br />
                                            <br />
                                            <span style="font-family: 宋体; font-size: 15px">驾照类型 C1、C2、C3、C4、C5、N、P</span>
                                        </div>
                                        <div style="width:120px;height:40px;margin-left:180px;margin-top:70px">
                                            <dx:ASPxButton ID="ASPxButtonSimulationC1_1" runat="server" Text="全真模拟"
                                                width="120px" Height="40px" Font-Names="华文楷体" Font-Size="20px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonSimulationC1_1_Click">
                                                <Border BorderWidth="2px" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width:400px;height:50px;margin-left:50px;margin-top:30px">
                                            <div style="width:105px;height:35px;float:left">
                                                <dx:ASPxButton ID="ASPxButtonAllOrderC1_1" runat="server" Text="顺序练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonAllOrderC1_1_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
                                            </div>
                                            <div style="width:105px;height:35px;float:left;margin-left:30px">
                                                <dx:ASPxButton ID="ASPxButtonWrongC1_1" runat="server" Text="错题练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonWrongC1_1_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
                                            </div>
                                            <div style="width:105px;height:35px;float:left;margin-left:30px">
                                                <dx:ASPxButton ID="ASPxButtonAllRandC1_1" runat="server" Text="随机练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonAllRandC1_1_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
                                            </div>
                                        </div>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>
                        </div>
                        <div style="width:50px;height:380px;float:left"></div>
                        <div style="width:500px;height:300px;float:left;margin-top:40px">
                            <dx:ASPxPanel ID="ASPxPanelC1Subject4" runat="server" Width="495px" Height="295px"
                                BackColor="#F1F1F1" Theme="MetropolisBlue">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <div style="width:360px;height:40px;margin-left:70px">
                                            <br />
                                            <br />
                                            <span style="font-family: 宋体; font-size: 24px">南京2016小车c1理论考试 科目四</span>
                                        </div>
                                        <div style="width:300px;height:30px;margin-left:100px">
                                            <br />
                                            <br />
                                            <span style="font-family: 宋体; font-size: 15px">驾照类型 C1、C2、C3、C4、C5、N、P</span>
                                        </div>
                                        <div style="width:120px;height:40px;margin-left:180px;margin-top:70px">
                                            <dx:ASPxButton ID="ASPxButtonSimulationC1_4" runat="server" Text="全真模拟"
                                                width="120px" Height="40px" Font-Names="华文楷体" Font-Size="20px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonSimulationC1_4_Click">
                                                <Border BorderWidth="2px" />
                                            </dx:ASPxButton>
                                        </div>
                                        <div style="width:400px;height:50px;margin-left:50px;margin-top:30px">
                                            <div style="width:105px;height:35px;float:left">
                                                <dx:ASPxButton ID="ASPxButtonAllOrderC1_4" runat="server" Text="顺序练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonAllOrderC1_4_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
                                            </div>
                                            <div style="width:105px;height:35px;float:left;margin-left:30px">
                                                <dx:ASPxButton ID="ASPxButtonWrongC1_4" runat="server" Text="错题练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonWrongC1_4_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
                                            </div>
                                            <div style="width:105px;height:35px;float:left;margin-left:30px">
                                                <dx:ASPxButton ID="ASPxButtonAllRandC1_4" runat="server" Text="随机练习"
                                                    width="100px" Height="35px" Font-Names="华文楷体" Font-Size="17px" ForeColor="#CC9900" Theme="Moderno" OnClick="ASPxButtonAllRandC1_4_Click">
                                                    <Border BorderWidth="2px" />
                                                </dx:ASPxButton>
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
