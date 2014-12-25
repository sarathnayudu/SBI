<%@ Page Title="Access Restricted" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="NoAccess.aspx.cs" Inherits="NoAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<asp:Label ID="lblAcessRestricted" Text="Sorry you don't have permission to access this page" runat="server"></asp:Label>
</asp:Content>