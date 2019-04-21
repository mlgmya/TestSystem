<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManCommon.Master" AutoEventWireup="true" CodeBehind="MTest.aspx.cs" Inherits="sy.Manager.MTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td class="auto-style1">
                    <font style="font-size:15px;">试题管理</font>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <asp:Button ID="btnadd" runat="server" Text="+添加" OnClick="btnadd_Click" />

                </td>
            </tr>
            <tr height="460px">
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" Width="60%"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" PageSize="5" DataKeyNames="试题编号" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="试题编号" HeaderText="试题编号" SortExpression="试题编号" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" >
                            </asp:BoundField>
                            <asp:BoundField DataField="选项A" HeaderText="选项A" SortExpression="选项A" >
                            </asp:BoundField>
                            <asp:BoundField DataField="选项B" HeaderText="选项B" SortExpression="选项B" />
                            <asp:BoundField DataField="选项C" HeaderText="选项C" SortExpression="选项C" />
                            <asp:BoundField DataField="选项D" HeaderText="选项D" SortExpression="选项D" />
                            <asp:BoundField DataField="答案" HeaderText="答案" SortExpression="答案" />
                            <asp:BoundField DataField="知识点编号" HeaderText="知识点编号" SortExpression="知识点编号" />
                            <asp:BoundField DataField="知识点名称" HeaderText="知识点名称" ReadOnly="True" SortExpression="知识点名称" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="SELECT 试题编号,题目,选项A,选项B,选项C,选项D,答案,MTest.知识点编号,知识点名称 FROM [MTest],MZsd where MTest.知识点编号=MZsd.知识点编号" DeleteCommand="DELETE FROM [MTest] WHERE [试题编号] = @试题编号" InsertCommand="INSERT INTO [MTest] ([试题编号], [题目], [选项A], [选项B], [选项C], [选项D], [答案], [知识点编号]) VALUES (@试题编号, @题目, @选项A, @选项B, @选项C, @选项D, @答案, @知识点编号)" UpdateCommand="UPDATE [MTest] SET [题目] = @题目, [选项A] = @选项A, [选项B] = @选项B, [选项C] = @选项C, [选项D] = @选项D, [答案] = @答案, [知识点编号] = @知识点编号 WHERE [试题编号] = @试题编号">
                        <DeleteParameters>
                            <asp:Parameter Name="试题编号" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="试题编号" Type="String" />
                            <asp:Parameter Name="题目" Type="String" />
                            <asp:Parameter Name="选项A" Type="String" />
                            <asp:Parameter Name="选项B" Type="String" />
                            <asp:Parameter Name="选项C" Type="String" />
                            <asp:Parameter Name="选项D" Type="String" />
                            <asp:Parameter Name="答案" Type="String" />
                            <asp:Parameter Name="知识点编号" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="题目" Type="String" />
                            <asp:Parameter Name="选项A" Type="String" />
                            <asp:Parameter Name="选项B" Type="String" />
                            <asp:Parameter Name="选项C" Type="String" />
                            <asp:Parameter Name="选项D" Type="String" />
                            <asp:Parameter Name="答案" Type="String" />
                            <asp:Parameter Name="知识点编号" Type="String" />
                            <asp:Parameter Name="试题编号" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
