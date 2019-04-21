<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManCommon.Master" AutoEventWireup="true" CodeBehind="MStu.aspx.cs" Inherits="sy.Man" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td>
                    <font style="font-size:15px;">学生管理</font>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Button ID="btnadd" runat="server" Text="+添加" OnClick="btnadd_Click" />

                </td>
            </tr>
            <tr height="460px">
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" Width="60%"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" PageSize="5" DataKeyNames="学号" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                            <asp:BoundField DataField="学生姓名" HeaderText="学生姓名" SortExpression="学生姓名" />
                            <asp:BoundField DataField="班级编号" HeaderText="班级编号" SortExpression="班级编号" />
                            <asp:BoundField DataField="班级名称" HeaderText="班级名称" ReadOnly="True" SortExpression="班级名称" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="SELECT 学号,学生姓名,MStu.班级编号,班级名称 FROM [MStu],MClass where MStu.班级编号=MClass.班级编号" DeleteCommand="DELETE FROM [MStu] WHERE [学号] = @学号" InsertCommand="INSERT INTO [MStu] ([学号], [学生姓名], [班级编号]) VALUES (@学号, @学生姓名, @班级编号)" UpdateCommand="UPDATE [MStu] SET [学生姓名] = @学生姓名, [班级编号] = @班级编号 WHERE [学号] = @学号">
                        <DeleteParameters>
                            <asp:Parameter Name="学号" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="学号" Type="String" />
                            <asp:Parameter Name="学生姓名" Type="String" />
                            <asp:Parameter Name="班级编号" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="学生姓名" Type="String" />
                            <asp:Parameter Name="班级编号" Type="String" />
                            <asp:Parameter Name="学号" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
