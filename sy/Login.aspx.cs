using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sy
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);

            if (radman.Checked==true)
            {
                string Sql = "select count(*) from Manager where ManId='" + txtUserID.Text + "'and pwd='" + txtPwd.Text+"'";
                SqlCommand cmd = new SqlCommand(Sql,conn);
                conn.Open();
                int iRe = (int)cmd.ExecuteScalar();
                if (iRe>0)
                {
                    conn.Close();
                    Session["id"] = txtUserID.Text;
                    Response.Redirect("Manager/MStu.aspx");
                }
                else
                    Response.Write("<script language='javascript'>alert('登录失败!')</script>");
            }

            if(radstu.Checked==true)
            {
                string Sql = "select count(*) from Student where StuId='" + txtUserID.Text + "'and pwd='" + txtPwd.Text + "'";
                SqlCommand cmd = new SqlCommand(Sql, conn);
                conn.Open();
                int iRe =(int)cmd.ExecuteScalar();
                if (iRe > 0)
                {
                    conn.Close();
                    Session["id"] = txtUserID.Text;
                    Response.Redirect("Student/STestList.aspx");
                }
                else
                    Response.Write("<script language='javascript'>alert('登录失败!')</script>");
            }

            if(radtea.Checked==true)
            {
                string Sql = "select count(*) from Teacher where TeaId='" + txtUserID.Text + "'and pwd='" + txtPwd.Text + "'";
                SqlCommand cmd = new SqlCommand(Sql, conn);
                conn.Open();
                int iRe = (int)cmd.ExecuteScalar();
                if (iRe > 0)
                {
                    conn.Close();
                    Session["id"] = txtUserID.Text;
                    Response.Redirect("Teacher/TTest.aspx");
                }
                else
                    Response.Write("<script language='javascript'>alert('登录失败!')</script>");
            }
        }
    }
}