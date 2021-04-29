/// <summary>
/// author      : Winndie Fan
/// created     : 28 Jan 2020
/// description : code behind for FmHome
/// </summary>

using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Kangaroo
{
    public partial class FmHome : System.Web.UI.Page
    {
        const string BTN_LOGIN = "LOGIN";
        private readonly Dictionary<int, string> AppDict = new Dictionary<int, string>()
        {
            {-99,"Network Error"},
            {-1,"Login Error"},
            {0,"Username or Password not recognised"},
            {1,"Success, valid Username and Password"},
            {2,"System being upgraded"},
            {3,"User is disabled"}
        };

        /// <summary>
        /// When BtnLogin is clicked, pass username and password to Login method
        /// Method end if fired by any other object
        /// </summary>
        protected void OnClick(object sender, EventArgs e)
        {
            if (sender is Button btn)
            {
                if (btn.CommandArgument.ToString().Equals(BTN_LOGIN))
                    OnLogin(TxtUsername.Text, TxtPassword.Text);
            }
        }

        /// <summary>
        /// Pass username and password to web method, redirect user to show message page
        /// Set session value depends on return code
        /// </summary>
        private void OnLogin(string username, string password)
        {
            int loginResult = -99;
            LoginService.RecruitmentSoapClient client =
                new LoginService.RecruitmentSoapClient();

            try
            {
                client.Open();
                loginResult = client.Login(username, password);
            }
            catch (Exception)
            {
                loginResult = -99;
            }
            finally
            {
                if(client != null)
                    client.Close();

                Session.Add("Msg", AppDict[loginResult]);
                Response.Write(Session["Msg"]);
                Response.Redirect("FmShowMsg.aspx", false);
            }
        }
    }
}
