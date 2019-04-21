<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sy.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线考试系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center"><br /><br /><br /><br /><br /><br /><br />
    <table class="content" style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellspacing="0" cellpadding="1" width=350 align="center"
				 border="1" bgColor="#ffffff" bordercolor="#BAD4F7">
				<tr height=40>
					<td colspan="2" align="center">	<br />					
						<font color=#4D2600><h2>在线考试系统登陆</h2></font>
					</td>
				</tr>							
				<tr>
					<td height="50" align="center"><h3>&nbsp;帐 &nbsp;号：</h3></td>
					<td height="30"><div align="left">						
							&nbsp;<asp:TextBox id="txtUserID" runat="server" MaxLength="20" Width="200px"></asp:TextBox>   
                        </div>                   
                       </td>                       
				</tr>
				<tr>
					<td align="center" height="30"><h3>&nbsp;密 &nbsp;码：</h3></td>
					<td height="50"><div align="left">
						&nbsp;<asp:TextBox id="txtPwd"  runat="server" MaxLength="20" TextMode="Password" Width="200px"></asp:TextBox>
                       </div>
                    </td>       
				</tr>
				<tr height=40>
                    <td colspan="2">
                        <center>
                        <asp:RadioButton ID="radman" runat="server" Text="管理员" GroupName="sf" />&nbsp;&nbsp;
                        <asp:RadioButton ID="radstu" runat="server" Text="学生" GroupName="sf" />&nbsp;&nbsp;
                        <asp:RadioButton ID="radtea" runat="server" Text="教师"  GroupName="sf"/>
                        </center>
                    </td>
				</tr>
				<tr height=50>
					<td align=center colspan="2">
                        
					    <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" />
                        
					</td>
				</tr>
			</table>
          <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
    </div>
    </div>
    </form>
</body>
</html>
