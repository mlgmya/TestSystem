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
    public partial class MTestadd : System.Web.UI.Page
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
            cmd.CommandText = "insert into MTest(试题编号,题目,选项A,选项B,选项C,选项D,答案,知识点编号) values(@id,@tm,@a,@b,@c,@d,@ans,@zsd)";

            cmd.Parameters.Add("@id", SqlDbType.Char, 50);
            cmd.Parameters["@id"].Value = TextBox1.Text;

            cmd.Parameters.Add("@tm", SqlDbType.Char, 20);
            cmd.Parameters["@tm"].Value = TextBox2.Text;

            cmd.Parameters.Add("@a", SqlDbType.Char, 20);
            cmd.Parameters["@a"].Value = TextBox3.Text;

            cmd.Parameters.Add("@b", SqlDbType.Char, 20);
            cmd.Parameters["@b"].Value = TextBox4.Text;

            cmd.Parameters.Add("@c", SqlDbType.Char, 20);
            cmd.Parameters["@c"].Value = TextBox5.Text;

            cmd.Parameters.Add("@d", SqlDbType.Char, 20);
            cmd.Parameters["@d"].Value = TextBox6.Text;

            cmd.Parameters.Add("@ans", SqlDbType.Char, 20);
            cmd.Parameters["@ans"].Value = TextBox7.Text;

            cmd.Parameters.Add("@zsd", SqlDbType.Char, 20);
            cmd.Parameters["@zsd"].Value = TextBox8.Text;

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