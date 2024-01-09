<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cities.aspx.cs" Inherits="SQLWebApplication.Cities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-container">
    <asp:SqlDataSource ID="SqlDataSourceCities" runat="server"
        ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" 
        DeleteCommand="DELETE FROM dbtables.city WHERE kod_city = ?" 
        InsertCommand="INSERT INTO dbtables.city (kod_city, name, tarifd, tarifn) VALUES (?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM dbtables.city" 
        UpdateCommand="UPDATE dbtables.city SET name = ?, tarifd = ?, tarifn = ? WHERE kod_city = ?">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="kod_city" PropertyName="SelectedValue" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="kod_city" PropertyName="Text" Type="Int64" />
            <asp:ControlParameter ControlID="TextBox2" Name="name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox3" Name="tarifd" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="TextBox4" Name="tarifn" PropertyName="Text" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="name" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="GridView1" Name="tarifd" PropertyName="SelectedValue" Type="Double" />
            <asp:ControlParameter ControlID="GridView1" Name="tarifn" PropertyName="SelectedValue" Type="Double" />
            <asp:ControlParameter ControlID="GridView1" Name="kod_city" PropertyName="SelectedValue" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceCities" ForeColor="#333333" GridLines="None" CssClass="centeredGrid" DataKeyNames="kod_city">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="kod_city" HeaderText="Код города" SortExpression="kod_city" />
            <asp:BoundField DataField="name" HeaderText="Название" SortExpression="name" />
            <asp:BoundField DataField="tarifd" HeaderText="Дневной тариф" SortExpression="tarifd" />
            <asp:BoundField DataField="tarifn" HeaderText="Ночной тариф" SortExpression="tarifn" />
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
    <asp:Button class="paddfordata" ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="Вставить" />
    <asp:TextBox class="paddfordata" ID="TextBox1" runat="server" style="margin-left: 35px"></asp:TextBox>
    <asp:TextBox class="paddfordata" ID="TextBox2" runat="server" style="margin-left: 9px" Width="121px"></asp:TextBox>
    <asp:TextBox class="paddfordata" ID="TextBox3" runat="server" style="margin-left: 5px"></asp:TextBox>
    <asp:TextBox class="paddfordata" ID="TextBox4" runat="server" style="margin-left: 6px"></asp:TextBox>
    <br />
    <br />
    <asp:Label class="paddfordata" ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Введите название города:"></asp:Label>
    <asp:TextBox class="paddfordata" ID="TextBox5" runat="server" Width="217px"></asp:TextBox>
    <br />
    <br />
    <asp:Button class="paddfordata" ID="Button1" runat="server" Height="31px" OnClick="Button1_Click" Text="Поиск" Width="81px" />
    <asp:Button class="paddfordata" ID="Button3" runat="server" Height="29px" OnClick="Button3_Click" Text="Отмена" Width="73px" />
    <br />
    <br />
</div>
</asp:Content>
