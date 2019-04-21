<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StuCommon.Master" AutoEventWireup="true" CodeBehind="STest.aspx.cs" Inherits="sy.Student.STest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <table style="width:100%;height:550px;">
            <tr>
                <td class="auto-style1">
                    <font style="font-size:15px;">考试中</font>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <asp:Label ID="Label10" runat="server" Text="剩余时间:"></asp:Label>
                        <asp:Label ID="lbltime" runat="server" Text="Label"></asp:Label>
                            
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
               <td>
                    <asp:gridview id="gridview1" runat="server" width="100%"
             autogeneratecolumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gridview1_SelectedIndexChanged1">
             <columns>
                 <asp:templatefield>
                 <headertemplate>
                     <asp:label id="label5" runat="server" text="选择题(每题"></asp:label>
                     <asp:label id="label6" runat="server" text="5"></asp:label>
                     <asp:label id="label7" runat="server" text="分)"></asp:label>
                 </headertemplate>
                     <itemtemplate>
                         <table style="width:100%;">
                             <tr>
                                 <td colspan='3'>
                                     <asp:label id="label1" runat="server" text='<%# (Container.DataItemIndex+1).ToString()%>'></asp:label>
                                     <asp:label id="label2" runat="server" text='<%#Eval("题目")%>'></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Label ID="Label8" runat="server" Text="答案:" visible="false"></asp:Label>
                                     <asp:label id="label3" runat="server" text='<%#Eval("答案")%>' visible="false"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Label ID="Label9" runat="server" Text="知识点:" visible="false"></asp:Label>
                                     <asp:label id="label4" runat="server" text='<%#Eval("知识点名称")%>' visible="false"></asp:label>
                                     </td>
                             </tr>
                             <tr>
                                 <td style="width:35%;">
                                     A:<asp:radiobutton id="radiobutton1" runat="server" text='<%#Eval("选项A")%>' groupname="s1"/>
                                 </td>
                                 <td style="width:35%;">
                                     B:<asp:radiobutton id="radiobutton2" runat="server" text='<%#Eval("选项B")%>' groupname="s1"/>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width:35%;">
                                     C:<asp:radiobutton id="radiobutton3" runat="server" text='<%#Eval("选项C")%>' groupname="s1"/>
                                 </td>
                                 <td style="width:35%;">
                                     D:<asp:radiobutton id="radiobutton4" runat="server" text='<%#Eval("选项D")%>' groupname="s1"/>
                                 </td>
                             </tr>
                         </table>
                     </itemtemplate>
                 </asp:templatefield>
             </columns>
             <headerstyle horizontalalign="left" />
         </asp:gridview>
                            
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:在线考试系统ConnectionString %>" SelectCommand="select top 2 题目,选项A,选项B,选项C,选项D,知识点名称,答案 from MTest,MZsd,MSub where MTest.知识点编号=MZsd.知识点编号 and MZsd.科目编号=MSub.科目编号 and MZsd.科目编号=@科目编号 order by newid()">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="科目编号" SessionField="subid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                            
                </td>
            <tr>
                <td><center>
                    <asp:Button ID="Button1" runat="server" Text="交卷" OnClick="Button1_Click" /></td></center>
            </tr>

            </tr>
        </table>
    </div>
</asp:Content>
