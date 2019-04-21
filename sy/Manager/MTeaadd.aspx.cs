using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sy.Manager
{
    public partial class MTeaadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Id = Request["id"];
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into MTea(教师编号,教师姓名,科目编号) values(@id,@name,@sub)";

            cmd.Parameters.Add("@id", SqlDbType.Char, 50);
            cmd.Parameters["@id"].Value = TextBox1.Text;

            cmd.Parameters.Add("@name", SqlDbType.Char, 20);
            cmd.Parameters["@name"].Value = TextBox2.Text;

            cmd.Parameters.Add("@sub", SqlDbType.Char, 20);
            cmd.Parameters["@sub"].Value = TextBox3.Text;

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