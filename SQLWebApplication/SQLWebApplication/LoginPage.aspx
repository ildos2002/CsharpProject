<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SQLWebApplication.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="centered-container">
    <asp:Label CssClass="paddfordata" ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Выполнить вход"></asp:Label>
<br />
<br />
<asp:Label CssClass="paddfordata" ID="Label2" runat="server" Text="Имя"></asp:Label>
<asp:TextBox CssClass="paddfordata" ID="TextBoxUsername" runat="server" style="margin-left: 9px" Width="176px"></asp:TextBox>
<asp:RequiredFieldValidator CssClass="paddfordata" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Пожалуйста введите имя" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label CssClass="paddfordata" ID="Label3" runat="server" Text="Пароль"></asp:Label>
<asp:TextBox CssClass="paddfordata" ID="TextBoxPassword" runat="server" style="margin-left: 10px" TextMode="Password" Width="175px"></asp:TextBox>
<asp:RequiredFieldValidator CssClass="paddfordata" ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Пожалуйста введите пароль" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button CssClass="paddfordata" ID="ButtonConnection" runat="server" Font-Bold="True" Font-Size="Large" Height="31px" OnClick="ButtonConnection_Click" Text="Войти" Width="75px" />
         <br />
<br />
          </div>
</asp:Content>
