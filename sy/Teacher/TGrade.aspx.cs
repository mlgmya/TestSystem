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
    public partial class TGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TGradeadd.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;

                TextBox tb = (TextBox)GridView1.BottomPagerRow.FindControl("inPageNum");
                tb.Text = (GridView1.PageIndex + 1).ToString();
            }
            catch
            {
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "go")
            {
                try
                {
                    TextBox tb = (TextBox)GridView1.BottomPagerRow.FindControl("inPageNum");
                    int num = Int32.Parse(tb.Text);
                    GridViewPageEventArgs ea = new GridViewPageEventArgs(num - 1);
                    GridView1_PageIndexChanging(null, ea);
                }
                catch
                {
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("delete from Grade where 考试编号=@id and 学号=@no and 班级编号=@class and 科目编号=@sub and 教师编号=@tea", conn);

            cmd.Parameters.Add("@id", SqlDbType.Char, 20);
            cmd.Parameters["@id"].Value = GridView1.Rows[e.RowIndex].Cells[0].Text;

            cmd.Parameters.Add("@no", SqlDbType.Char, 20);
            cmd.Parameters["@no"].Value = GridView1.Rows[e.RowIndex].Cells[1].Text;

            cmd.Parameters.Add("@class", SqlDbType.Char, 20);
            cmd.Parameters["@class"].Value = GridView1.Rows[e.RowIndex].Cells[3].Text;

            cmd.Parameters.Add("@sub", SqlDbType.Char, 20);
            cmd.Parameters["@sub"].Value = GridView1.Rows[e.RowIndex].Cells[5].Text;

            cmd.Parameters.Add("@tea", SqlDbType.Char, 20);
            cmd.Parameters["@tea"].Value = GridView1.Rows[e.RowIndex].Cells[7].Text;
            conn.Open();

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('删除成功！');</script>");
            else
                Response.Write("<script>alert('删除失败！');</script>");
            conn.Close();
            GridView1.EditIndex = -1;

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update TTest set 成绩=@grade where 考试编号=@id and 学号=@no and 班级编号=@class and 科目编号=@sub and 教师编号=@tea";

            cmd.Parameters.Add("@id", SqlDbType.Char, 20);
            cmd.Parameters["@id"].Value = GridView1.Rows[e.RowIndex].Cells[0].Text;

            cmd.Parameters.Add("@no", SqlDbType.Char, 20);
            cmd.Parameters["@no"].Value = GridView1.Rows[e.RowIndex].Cells[1].Text;

            cmd.Parameters.Add("@class", SqlDbType.Char, 20);
            cmd.Parameters["@class"].Value = GridView1.Rows[e.RowIndex].Cells[3].Text;

            cmd.Parameters.Add("@sub", SqlDbType.Char, 20);
            cmd.Parameters["@sub"].Value = GridView1.Rows[e.RowIndex].Cells[5].Text;

            cmd.Parameters.Add("@tea", SqlDbType.Char, 20);
            cmd.Parameters["@tea"].Value = GridView1.Rows[e.RowIndex].Cells[7].Text;

            cmd.Parameters.Add("@grade", SqlDbType.Char, 20);
            cmd.Parameters["@grade"].Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text;

            cmd.Connection = conn;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('修改成功！');</script>");
            else
                Response.Write("<script>alert('修改失败！');</script>");
            conn.Close();
            GridView1.EditIndex = -1;

        }
    }
}