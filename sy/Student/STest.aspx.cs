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
    public partial class STest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string subid = Session["subid"].ToString();
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand c = new SqlCommand();
            c.CommandText = "select 结束时间 from TTest where 科目编号='" + subid + "'";

            c.Connection = conn;
            DateTime etime = Convert.ToDateTime(c.ExecuteScalar());
            TimeSpan time = etime - DateTime.Now;
            lbltime.Text = time.ToString().Split('.')[0];
            conn.Close();

            if (time.TotalMinutes < 10&& time.TotalMinutes>0)
            {

                lbltime.Text = time.ToString().Split('.')[0]+"考试即将结束";
                lbltime.ForeColor = System.Drawing.Color.Red;
            }

            else if (time.TotalMinutes < 0)
            {
                submit();
                Response.Redirect("SGrade.aspx");
            }
        }

        public void submit()
        {
            string subid = Session["subid"].ToString();
            string no = Session["id"].ToString();
            int grade = 0;
            for (int i = 0; i < gridview1.Rows.Count; i++)
            {
                Label Label3 = gridview1.Rows[i].FindControl("label3") as Label;
                Label3.Visible = true;
                Label Label4 = gridview1.Rows[i].FindControl("label4") as Label;
                Label4.Visible = true;
                Label Label8 = gridview1.Rows[i].FindControl("label8") as Label;
                Label8.Visible = true;
                Label Label9 = gridview1.Rows[i].FindControl("label9") as Label;
                Label9.Visible = true;

                RadioButton rad1 = gridview1.Rows[i].FindControl("radiobutton1") as RadioButton;
                RadioButton rad2 = gridview1.Rows[i].FindControl("radiobutton2") as RadioButton;
                RadioButton rad3 = gridview1.Rows[i].FindControl("radiobutton3") as RadioButton;
                RadioButton rad4 = gridview1.Rows[i].FindControl("radiobutton4") as RadioButton;

                if (Label3.Text == "A                   " && rad1.Checked == true)
                    grade += 5;
                else if (Label3.Text == "B                   " && rad2.Checked == true)
                    grade += 5;
                else if (Label3.Text == "C                   " && rad3.Checked == true)
                    grade += 5;
                else if (Label3.Text == "D                   " && rad4.Checked == true)
                    grade += 5;
            }
            Response.Write("<script>alert('你的成绩为" + grade + "');</script>");


            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand c = new SqlCommand();
            c.CommandText = "select 班级编号 from MStu where 学号='" + no + "'";

            c.Connection = conn;
            string classid = Convert.ToString(c.ExecuteScalar());

            SqlCommand t = new SqlCommand();
            t.CommandText = "select 教师编号 from MTea where 科目编号='" + subid + "'";

            t.Connection = conn;
            string teaid = Convert.ToString(t.ExecuteScalar());

            SqlCommand s = new SqlCommand();
            s.CommandText = "select 考试编号 from TTest where 班级编号='" + classid + "' and 科目编号='" + subid + "'";

            s.Connection = conn;
            string testid = Convert.ToString(s.ExecuteScalar());

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into Grade(考试编号,学号,班级编号,科目编号,教师编号,成绩) values('" + testid + "','" + no + "','" + classid + "','" + subid + "','" + teaid + "','" + grade + "')";

            cmd.Connection = conn;
            int j = cmd.ExecuteNonQuery();
            if (j > 0)
                Response.Write("<script>alert('考试保存成功！');</script>");
            else
                Response.Write("<script>alert('考试保存失败！');</script>");
            conn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            submit();
            Timer1.Enabled=false;
        }

        protected void gridview1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        
    }
}