using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sy
{
    public partial class ManCommon : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["id"].ToString();
            string str = "Data Source=DESKTOP-80SH65J\\SQLEXPRESS;Initial Catalog=在线考试系统;Integrated Security=True";
            SqlConnection conn = new SqlConnection(str);

            string Sql = "select ManName from Manager where ManId='" + id + "'";
            SqlCommand cmd = new SqlCommand(Sql, conn);
            conn.Open();

            Label1.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();
        }
    }
}