<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManCommon.Master" AutoEventWireup="true" CodeBehind="MTestadd.aspx.cs" Inherits="sy.Manager.MTestadd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <table style="width:100%;height:550px;">
            <tr height=30px>
                <td>
                    <font style="font-size:15px;">试题添加</font>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div>
                        <table align="center" style="height: 219px; width: 366px">
                            <tr>
                                <td>
                                   试题编号 :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    题目：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    选项A：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    选项B：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    选项C：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    选项D：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    答案：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    知识点编号：
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
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
