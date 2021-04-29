/// <summary>
/// author      : Winndie Fan
/// created     : 28 Jan 2020
/// description : code behind for Show message page
/// </summary>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kangaroo
{
    public partial class FmShowMsg : System.Web.UI.Page
    {
        /// <summary>
        /// Receive and display session value from main page
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            TxtShowMsg.Text = Session["Msg"].ToString();
        }
    }
}