<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testpop.aspx.cs" Inherits="testpop" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
        <dx:ASPxButton ID="ASPxButton1" runat="server" 
            Height="67px" Text="ASPxButton" Theme="Glass" Width="222px" AutoPostBack="False" EnableTheming="True">
            <ClientSideEvents Click="function(s, e) {PopupControlTest.Show();return false;}" />
        </dx:ASPxButton>  
        <dx:ASPxButton ID="ASPxButton3" runat="server" Height="59px" Text="ASPxButton" Width="222px">
            <ClientSideEvents Click="function(s, e) {
PopupControlTest.Hide();
return false;
	
}" />
        </dx:ASPxButton>
        <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" ClientInstanceName="PopupControlTest" 
            PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Height="126px" Width="247px" 
            PopupAnimationType="Fade" ShowCloseButton="False" CloseAction="None" Theme="DevEx">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxButton ID="ASPxButton4" runat="server" 
                        Height="59px" Text="ASPxButton" Width="150px" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {PopupControlTest.Hide();return false;}" />
                    </dx:ASPxButton>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

    </form>
</body>
</html>
