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
    public partial class MSubadd : System.Web.UI.Page
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
            cmd.CommandText = "insert into MSub(科目编号,科目名称,教师编号) values(@id,@name,@teacher)";

            cmd.Parameters.Add("@id", SqlDbType.Char, 50);
            cmd.Parameters["@id"].Value = TextBox1.Text;

            cmd.Parameters.Add("@name", SqlDbType.Char, 20);
            cmd.Parameters["@name"].Value = TextBox2.Text;

            cmd.Parameters.Add("@teacher", SqlDbType.Char, 20);
            cmd.Parameters["@teacher"].Value = TextBox3.Text;
            
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