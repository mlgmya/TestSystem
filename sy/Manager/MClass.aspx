<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManCommon.Master" AutoEventWireup="true" CodeBehind="MClass.aspx.cs" Inherits="sy.Manager.MClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td class="auto-style1">
                    <font style="font-size:15px;">班级管理</font>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <asp:Button ID="btnadd" runat="server" Text="+添加" OnClick="btnadd_Click" />

                </td>
            </tr>
            <tr height="460px">
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" Width="60%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" PageSize="5" DataKeyNames="班级编号" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="班级编号" HeaderText="班级编号" SortExpression="班级编号" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:BoundField DataField="班级名称" HeaderText="班级名称" SortExpression="班级名称" >
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerTemplate>
                             <br />
                            <asp:Label ID="lblPage" runat="server" Text='<%# "第" + (((GridView)Container.NamingContainer).PageIndex + 1)  + "页/共" + (((GridView)Container.NamingContainer).PageCount) + "页" %> '></asp:Label>
                            <asp:LinkButton ID="lbnFirst" runat="Server" Text="首页"  Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="First" ></asp:LinkButton>
                            <asp:LinkButton ID="lbnPrev" runat="server" Text="上一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="Prev"  ></asp:LinkButton>
                            <asp:LinkButton ID="lbnNext" runat="Server" Text="下一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Next" ></asp:LinkButton>
                            <asp:LinkButton ID="lbnLast" runat="Server" Text="尾页"   Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Last" ></asp:LinkButton>
                                到第<asp:TextBox runat="server" ID="inPageNum" Width="20px"></asp:TextBox>页 
                            <asp:Button ID="Button1" runat="server" Text="GO" CommandName="go"/>
                            <br />

                        </PagerTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="SELECT * FROM [MClass]" DeleteCommand="DELETE FROM [MClass] WHERE [班级编号] = @班级编号" InsertCommand="INSERT INTO [MClass] ([班级编号], [班级名称]) VALUES (@班级编号, @班级名称)" UpdateCommand="UPDATE [MClass] SET [班级名称] = @班级名称 WHERE [班级编号] = @班级编号">
                        <DeleteParameters>
                            <asp:Parameter Name="班级编号" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="班级编号" Type="String" />
                            <asp:Parameter Name="班级名称" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="班级名称" Type="String" />
                            <asp:Parameter Name="班级编号" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
