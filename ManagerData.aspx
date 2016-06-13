<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerData.aspx.cs" Inherits="ManagerData" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Theme="MetropolisBlue">
            <TabPages>
                <dx:TabPage Name="Tab1" Text="题目信息">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id">
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="question" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="answer" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="item1" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="item2" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="item3" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="item4" ShowInCustomizationForm="True" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="explains" ShowInCustomizationForm="True" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="url" ShowInCustomizationForm="True" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="Tab2" Text="做题历史">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="id">
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataDateColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="username" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="score" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="usedtime" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="wrongid_c1_1" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="wrongid_c1_4" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="Tab3" Text="用户信息">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="username">
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="username" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="password" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="wrongid_c1_1" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="wrongid_c1_4" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionsConnectionString %>" DeleteCommand="DELETE FROM [c1_1Questions] WHERE [id] = @id" InsertCommand="INSERT INTO [c1_1Questions] ([id], [question], [answer], [item1], [item2], [item3], [item4], [explains], [url]) VALUES (@id, @question, @answer, @item1, @item2, @item3, @item4, @explains, @url)" SelectCommand="SELECT * FROM [c1_1Questions]" UpdateCommand="UPDATE [c1_1Questions] SET [question] = @question, [answer] = @answer, [item1] = @item1, [item2] = @item2, [item3] = @item3, [item4] = @item4, [explains] = @explains, [url] = @url WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer" Type="Byte" />
                <asp:Parameter Name="item1" Type="String" />
                <asp:Parameter Name="item2" Type="String" />
                <asp:Parameter Name="item3" Type="String" />
                <asp:Parameter Name="item4" Type="String" />
                <asp:Parameter Name="explains" Type="String" />
                <asp:Parameter Name="url" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer" Type="Byte" />
                <asp:Parameter Name="item1" Type="String" />
                <asp:Parameter Name="item2" Type="String" />
                <asp:Parameter Name="item3" Type="String" />
                <asp:Parameter Name="item4" Type="String" />
                <asp:Parameter Name="explains" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionsConnectionString2 %>" DeleteCommand="DELETE FROM [TestHistory] WHERE [id] = @id" InsertCommand="INSERT INTO [TestHistory] ([id], [username], [score], [usedtime], [wrongid_c1_1], [wrongid_c1_4]) VALUES (@id, @username, @score, @usedtime, @wrongid_c1_1, @wrongid_c1_4)" SelectCommand="SELECT * FROM [TestHistory]" UpdateCommand="UPDATE [TestHistory] SET [username] = @username, [score] = @score, [usedtime] = @usedtime, [wrongid_c1_1] = @wrongid_c1_1, [wrongid_c1_4] = @wrongid_c1_4 WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="DateTime" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="score" Type="Int32" />
                <asp:Parameter Name="usedtime" Type="String" />
                <asp:Parameter Name="wrongid_c1_1" Type="String" />
                <asp:Parameter Name="wrongid_c1_4" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="score" Type="Int32" />
                <asp:Parameter Name="usedtime" Type="String" />
                <asp:Parameter Name="wrongid_c1_1" Type="String" />
                <asp:Parameter Name="wrongid_c1_4" Type="String" />
                <asp:Parameter Name="id" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionsConnectionString3 %>" DeleteCommand="DELETE FROM [Users] WHERE [username] = @username" InsertCommand="INSERT INTO [Users] ([username], [password], [wrongid_c1_1], [wrongid_c1_4]) VALUES (@username, @password, @wrongid_c1_1, @wrongid_c1_4)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [password] = @password, [wrongid_c1_1] = @wrongid_c1_1, [wrongid_c1_4] = @wrongid_c1_4 WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="wrongid_c1_1" Type="String" />
                <asp:Parameter Name="wrongid_c1_4" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="wrongid_c1_1" Type="String" />
                <asp:Parameter Name="wrongid_c1_4" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
