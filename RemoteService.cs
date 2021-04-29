using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

namespace Kangaroo
{
    [WebService(Namespace = "http://tempuri.org")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RemoteService: System.Web.Services.WebService
    {
        [WebMethod]
        public static int Login(string username, string password)
        {
            int loginResult = -99;

            try
            {
                LoginService.RecruitmentSoapClient client =
                    new LoginService.RecruitmentSoapClient();

                client.Open();
                //loginResult = client.Login(username, password);
                loginResult = client.Login("user1@twrecruitment.com", "123abc");
                client.Close();
            }
            catch (Exception e) {
                e = null;
            }
            return loginResult;

            }
        }
}