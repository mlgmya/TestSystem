<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StuCommon.Master" AutoEventWireup="true" CodeBehind="STestList.aspx.cs" Inherits="sy.Student.STestList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td class="auto-style1">
                    <font style="font-size:15px;">考试列表</font>
                </td>
            </tr>
            <tr height="460px">
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" Width="60%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="考试编号" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="考试编号" HeaderText="考试编号" SortExpression="考试编号" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:BoundField DataField="科目编号" HeaderText="科目编号" SortExpression="科目编号" >
                            </asp:BoundField>
                            <asp:BoundField DataField="科目名称" HeaderText="科目名称" SortExpression="科目名称" >
                            </asp:BoundField>
                            <asp:BoundField DataField="班级编号" HeaderText="班级编号" SortExpression="班级编号" >
                            </asp:BoundField>
                            <asp:BoundField DataField="班级名称" HeaderText="班级名称" SortExpression="班级名称" />
                            <asp:BoundField DataField="开始时间" HeaderText="开始时间" SortExpression="开始时间" />
                            <asp:BoundField DataField="结束时间" HeaderText="结束时间" SortExpression="结束时间" />
                            <asp:ButtonField CommandName="Select" Text="点击考试" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="select 考试编号,TTest.科目编号,科目名称,TTest.班级编号,班级名称,开始时间,结束时间 from TTest,MSub,MClass where TTest.科目编号=MSub.科目编号 and TTest.班级编号=MClass.班级编号 and TTest.班级编号=(select 班级编号 from MStu where [学号] = @学号)" DeleteCommand="DELETE FROM [MStu] WHERE [编号] = @编号" InsertCommand="INSERT INTO [MStu] ([编号], [学号], [姓名], [班级]) VALUES (@编号, @学号, @姓名, @班级)" UpdateCommand="UPDATE [MStu] SET [学号] = @学号, [姓名] = @姓名, [班级] = @班级 WHERE [编号] = @编号">
                        <DeleteParameters>
                            <asp:Parameter Name="编号" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="编号" Type="Int32" />
                            <asp:Parameter Name="学号" Type="String" />
                            <asp:Parameter Name="姓名" Type="String" />
                            <asp:Parameter Name="班级" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="学号" SessionField="id" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="学号" Type="String" />
                            <asp:Parameter Name="姓名" Type="String" />
                            <asp:Parameter Name="班级" Type="String" />
                            <asp:Parameter Name="编号" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
