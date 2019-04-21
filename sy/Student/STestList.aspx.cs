using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sy.Student
{
    public partial class STestList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            
            string subid= GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            Session["subid"] = subid;

            string no = Session["id"].ToString();

            DateTime Today = DateTime.Now;
            DateTime stime = Convert.ToDateTime(GridView1.Rows[e.NewSelectedIndex].Cells[5].Text);
            DateTime etime = Convert.ToDateTime(GridView1.Rows[e.NewSelectedIndex].Cells[6].Text);
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from Grade where 学号='" + no + "' and 科目编号='" + subid + "'";

            cmd.Connection = conn;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i > 0)
                GridView1.Rows[e.NewSelectedIndex].Cells[7].Text = "已参加考试";
            else if (Today >= etime)
                GridView1.Rows[e.NewSelectedIndex].Cells[7].Text = "已结束";
            else if(Today<=stime)
                GridView1.Rows[e.NewSelectedIndex].Cells[7].Text = "未开始";
            else
            {
                GridView1.Rows[e.NewSelectedIndex].Cells[7].Text = "点击考试";
                Response.Redirect("STest.aspx");
            }

            
            conn.Close();
        }
    }
}