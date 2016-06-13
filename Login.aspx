<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body
        {
            background-image:url('/background.jpg');
            background-repeat:no-repeat
        }
    </style>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxPanel ID="ASPxDockPanel1" runat="server" Height="400px" Width="350px"
        style="border:0px;margin-left:470px;margin-top:80px;box-shadow: 0 10px 30px rgba(0, 0, 0, 0.14), 0 10px 10px rgba(0, 0, 0, 0.44)"  
        ShowCloseButton="False" ShowHeader="False" Opacity="100" BackColor="White">
        <PanelCollection>
            <dx:PanelContent>
                <div style="width:120px;height:20px"></div>
                <div style="width:120px;height:120px;margin-left:105px;margin-top:10px">
                    <asp:Image runat="server" ImageUrl="/headImage.png"/>
                </div>
                <div style="width:170px;height:30px;margin-left:80px;margin-top:30px">
                    <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" Width="165px" height="30px"
                        Theme="MetropolisBlue" style="border-width:0px 0px thin 0px" Font-Size="20px">
                    </dx:ASPxTextBox>
                </div>
                <div style="width:170px;height:30px;margin-left:80px;margin-top:15px">
                    <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" Width="165px" height="30px" Password="true"
                        Theme="MetropolisBlue" style="border-width:0px 0px thin 0px" Font-Size="20px">
                    </dx:ASPxTextBox>
                </div>
                <div style="width:280px;height:50px;margin-left:30px;margin-top:40px">
                    <div style="width:120px;height:40px;float:left">
                        <dx:ASPxButton ID="ASPxButtonLogin" runat="server" Text="登  陆" 
                            width="120px" Height="40px" Theme="MetropolisBlue" Font-Size="20px" OnClick="ASPxButtonLogin_Click">
                            <Border BorderWidth="0px" />                            
                        </dx:ASPxButton>
                    </div>
                    <div style="width:120px;height:40px;float:left;margin-left:40px">
                        <dx:ASPxButton ID="ASPxButtonRegister" runat="server" Text="注 册"
                            width="120px" Height="40px" Theme="MetropolisBlue" Font-Size="20px" OnClick="ASPxButtonRegister_Click">
                            <Border BorderWidth="0px" />                              
                        </dx:ASPxButton>
                    </div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel> 
    </form>
</body>
</html>
