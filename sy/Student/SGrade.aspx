<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StuCommon.Master" AutoEventWireup="true" CodeBehind="SGrade.aspx.cs" Inherits="sy.Student.SGrade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td class="auto-style1">
                    <font style="font-size:15px;">查看成绩</font>
                </td>
            </tr>
            <tr height="460px">
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" Width="60%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="成绩">
                        <Columns>
                            <asp:BoundField DataField="考试编号" HeaderText="考试编号" SortExpression="考试编号" >
                            </asp:BoundField>
                            <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" >
                            </asp:BoundField>
                            <asp:BoundField DataField="学生姓名" HeaderText="学生姓名" SortExpression="学生姓名" />
                            <asp:BoundField DataField="科目编号" HeaderText="科目编号" SortExpression="科目编号" >
                            </asp:BoundField>
                            <asp:BoundField DataField="科目名称" HeaderText="科目名称" SortExpression="科目名称" >
                            </asp:BoundField>
                            <asp:BoundField DataField="班级编号" HeaderText="班级编号" SortExpression="班级编号" />
                            <asp:BoundField DataField="班级名称" HeaderText="班级名称" SortExpression="班级名称" />
                            <asp:BoundField DataField="成绩" HeaderText="成绩" ReadOnly="True" SortExpression="成绩" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="select 考试编号,Grade.学号,学生姓名,Grade.科目编号,科目名称,Grade.班级编号,班级名称,成绩 from Grade,MSub,MClass,MStu where Grade.学号=MStu.学号 and Grade.科目编号=MSub.科目编号 and Grade.班级编号=MClass.班级编号 and Grade.班级编号=(select 班级编号 from MStu where 学号=@学号)">
                        <SelectParameters>
                            <asp:SessionParameter Name="学号" SessionField="id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
