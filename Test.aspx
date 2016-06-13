<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Height="81px" Text="Button" Width="300px" OnClick="Button1_Click" 
            style="margin-left: 96px"  />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="222px" TextMode="MultiLine" Width="483px"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>
