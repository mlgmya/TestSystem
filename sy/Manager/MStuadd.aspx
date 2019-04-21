<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManCommon.Master" AutoEventWireup="true" CodeBehind="MStuadd.aspx.cs" Inherits="sy.MStuadd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;height:550px;">
            <tr height=30px>
                <td>
                    <font style="font-size:15px;">学生添加</font>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div>
                        <table align="center" style="height: 234px; width: 326px">
                            <tr>
                                <td>
                                    学号：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    学生姓名：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    班级编号：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            </table>
        </div>
</asp:Content>
