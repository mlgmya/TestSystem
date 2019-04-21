using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sy.Teacher
{
    public partial class TTestadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into TTest(考试编号,科目编号,班级编号,开始时间,结束时间) values(@id,@sub,@class,@stime,@etime)";

            cmd.Parameters.Add("@id", SqlDbType.Char, 50);
            cmd.Parameters["@id"].Value = TextBox1.Text;

            cmd.Parameters.Add("@sub", SqlDbType.Char, 20);
            cmd.Parameters["@sub"].Value = TextBox2.Text;

            cmd.Parameters.Add("@class", SqlDbType.Char, 20);
            cmd.Parameters["@class"].Value = TextBox3.Text;

            cmd.Parameters.Add("@stime", SqlDbType.Char, 20);
            cmd.Parameters["@stime"].Value = txtST.Text;

            cmd.Parameters.Add("@etime", SqlDbType.Char, 20);
            cmd.Parameters["@etime"].Value = txtET.Text;

            cmd.Connection = conn;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('保存成功！');</script>");
            else
                Response.Write("<script>alert('保存失败！');</script>");
            conn.Close();
        }
    }
}