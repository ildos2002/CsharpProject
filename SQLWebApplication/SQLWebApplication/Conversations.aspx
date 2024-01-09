<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Conversations.aspx.cs" Inherits="SQLWebApplication.Conversations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-container">
 <div class="centered">
     <asp:Label ID="LabelSession" runat="server" Font-Bold="True" Text="Label"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="ButtonLogOut" runat="server" Font-Bold="True" Font-Size="Large" Height="32px" OnClick="ButtonLogOut_Click" Text="Выход" Width="73px" />
     </div>
     <br />
        <div class="centered">
<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Harlow Solid Italic" Font-Size="XX-Large" Font-Strikeout="False" ForeColor="#009900" Text="ПЕРЕГОВОРЫ"></asp:Label>
    </div>
            <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceSubscribers" runat="server" ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>" SelectCommand="SELECT * FROM dbtables.subscribers"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSqlDataSourceWord" runat="server" SelectCommand="SELECT 
    c.kod_talk,
    subs.phone_number, 
    city.name, 
    c.date, 
    c.minutes, 
    c.time, 
    ROUND(
        CASE 
            WHEN c.time BETWEEN '06:00:00' AND '22:59:59' THEN c.minutes * city.tarifd 
            ELSE c.minutes * city.tarifn 
        END::numeric, 2) AS cost
FROM 
    dbtables.conversations AS c, dbtables.subscribers AS subs, dbtables.city AS city
WHERE
    c.kod_city = city.kod_city AND c.kob_sub = subs.kob_sub " ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCities" runat="server" ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>" SelectCommand="SELECT * FROM dbtables.city"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceConversations" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PCConnectionString %>" 
        DeleteCommand="DELETE FROM dbtables.conversations WHERE kod_talk = ?" 
        InsertCommand="INSERT INTO dbtables.conversations (kod_talk, kob_sub, kod_city, date, minutes, time) 
        VALUES (?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:PCConnectionString.ProviderName %>" 
        SelectCommand="SELECT 
    c.kod_talk,
    c.kob_sub, 
    c.kod_city, 
    c.date, 
    c.minutes, 
    c.time, 
    ROUND(
        CASE 
            WHEN c.time BETWEEN '06:00:00' AND '22:59:59' THEN c.minutes * city.tarifd 
            ELSE c.minutes * city.tarifn 
        END::numeric, 2) AS cost
FROM 
    dbtables.conversations AS c
JOIN 
    dbtables.city AS city
ON 
    c.kod_city = city.kod_city" 
        UpdateCommand="UPDATE dbtables.conversations SET kob_sub = ?, kod_city = ?, date = ?, minutes = ?, time = ? WHERE kod_talk = ?">
        <DeleteParameters>
            <asp:Parameter Name="kod_talk" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="kod_talk" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="DetailsView1" Name="kob_sub" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="DetailsView1" Name="kod_city" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="DetailsView1" Name="date" PropertyName="SelectedValue" Type="DateTime" />
            <asp:ControlParameter ControlID="DetailsView1" Name="minutes" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="DetailsView1" Name="time" PropertyName="SelectedValue" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="kod_talk" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="GridView1" Name="kob_sub" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="GridView1" Name="kod_city" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="GridView1" Name="date" PropertyName="SelectedValue" Type="DateTime" />
            <asp:ControlParameter ControlID="GridView1" Name="minutes" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="GridView1" Name="time" PropertyName="SelectedValue" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label class="paddfordata" ID="Label1" runat="server" EnableTheming="True" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="Red" Text="Заполните форму: "></asp:Label>
    <asp:DetailsView class="paddfordata" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="kod_talk" DataSourceID="SqlDataSourceConversations" DefaultMode="Insert" Height="0px" Width="0px" OnPageIndexChanging="DetailsView1_PageIndexChanging">
        <Fields>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            <asp:TemplateField HeaderText="Код переговоров">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kod_talk") %>' Width="150px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Абонент">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceSubscribers" DataTextField="phone_number" DataValueField="kob_sub" SelectedValue='<%# Bind("kob_sub") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Город">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceCities" DataTextField="name" DataValueField="kod_city" SelectedValue='<%# Bind("kod_city") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Дата">
                <ItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("date") %>'></asp:Calendar>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Количество минут">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("minutes") %>' Width="150px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Время суток">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("time") %>' Width="150px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    &nbsp;&nbsp;&nbsp;
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceConversations" ForeColor="#333333" GridLines="None" CssClass="centeredGrid" AllowSorting="True" DataKeyNames="kod_talk" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="kod_talk" HeaderText="Код разговора" SortExpression="kod_talk" />
            <asp:TemplateField HeaderText="Абонент" SortExpression="kob_sub">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceSubscribers" DataTextField="phone_number" DataValueField="kob_sub" SelectedValue='<%# Bind("kob_sub") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceSubscribers" DataTextField="phone_number" DataValueField="kob_sub" SelectedValue='<%# Bind("kob_sub") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Город" SortExpression="kod_city">
                <EditItemTemplate>
                     <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceCities" DataTextField="name" DataValueField="kod_city" SelectedValue='<%# Bind("kod_city") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceCities" DataTextField="name" DataValueField="kod_city" SelectedValue='<%# Bind("kod_city") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date" HeaderText="Дата" SortExpression="date" DataFormatString="{0:dd.mm.yyyy}" />
            <asp:BoundField DataField="minutes" HeaderText="Минуты" SortExpression="minutes" />
            <asp:BoundField DataField="time" HeaderText="Время" SortExpression="time" />
            <asp:BoundField DataField="cost" HeaderText="Стоимость" SortExpression="cost" />
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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 13px" Text="Экспорт в Word" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 37px" Text="Экспорт в Excel" />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSqlDataSourceWord" Visible="False">
            <Columns>
                <asp:BoundField DataField="kod_talk" HeaderText="kod_talk" SortExpression="kod_talk" />
                <asp:BoundField DataField="phone_number" HeaderText="phone_number" SortExpression="phone_number" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="minutes" HeaderText="minutes" SortExpression="minutes" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
            </Columns>
        </asp:GridView>
        <br />
        </div>
<br />
</asp:Content>
