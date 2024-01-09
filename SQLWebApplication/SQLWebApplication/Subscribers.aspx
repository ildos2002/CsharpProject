<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Subscribers.aspx.cs" Inherits="SQLWebApplication.Subscribers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-container">
    <asp:SqlDataSource ID="SqlDataSourceSubscribers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" 
        DeleteCommand="DELETE FROM dbtables.subscribers WHERE (kob_sub = ?)" 
        InsertCommand="INSERT INTO dbtables.subscribers (kob_sub, phone_number, inn, adress) VALUES (?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>" 
        SelectCommand="SELECT kob_sub, phone_number, inn, adress FROM dbtables.subscribers" 
        UpdateCommand="UPDATE dbtables.subscribers SET phone_number = ?, inn = ?, adress = ? WHERE (kob_sub = ?)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="kob_sub" PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="kob_sub" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="phone_number" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="inn" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="adress" PropertyName="Text" />
        </InsertParameters>
        <UpdateParameters>
             <asp:ControlParameter ControlID="GridView1" Name="kob_sub" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="GridView1" Name="phone_number" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="GridView1" Name="inn" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="GridView1" Name="adress" PropertyName="SelectedValue" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceSubscribers" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="centeredGrid" DataKeyNames="kob_sub">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="kob_sub" HeaderText="Код абонента" SortExpression="kob_sub" />
            <asp:BoundField DataField="phone_number" HeaderText="Номер телефона" SortExpression="phone_number" />
            <asp:BoundField DataField="inn" HeaderText="ИНН" SortExpression="inn" />
            <asp:BoundField DataField="adress" HeaderText="Адрес" SortExpression="adress" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
<br />
<asp:Button class="paddfordata" ID="InsertButton" runat="server" Text="Вставить" OnClick="InsertButton_Click" />
<asp:TextBox class="paddfordata" ID="TextBox1" runat="server" Width="58px" CssClass="margintextbox"></asp:TextBox>
<asp:TextBox class="paddfordata" ID="TextBox2" runat="server" Width="140px" CssClass="margintextbox"></asp:TextBox>
<asp:TextBox class="paddfordata" ID="TextBox3" runat="server" Width="180px" CssClass="margintextbox"></asp:TextBox>
<asp:TextBox class="paddfordata" ID="TextBox4" runat="server" Width="235px" CssClass="margintextbox"></asp:TextBox>
    <br />
    <br />
    <asp:Label class="paddfordata" ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" Text="Введите телефон абонента:"></asp:Label>
<asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="156px"></asp:TextBox>
    <br />
    <br />
    <asp:Button class="paddfordata"  ID="Button1" runat="server" Height="30px" OnClick="Button1_Click" Text="Поиск" Width="81px" />
    <asp:Button class="paddfordata" ID="Button2" runat="server" Height="29px" OnClick="Button2_Click" Text="Отмена" Width="76px" />
        <br />
        <br />
        </div>
</asp:Content>
