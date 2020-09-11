using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace Tal
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes); // Registers routes
            BundleConfig.RegisterBundles(BundleTable.Bundles); // Generates the bundles
            Application["counter"] = 0; // אתחול כמות המשתמשים באתר ל-
        }
        void Session_Start(object sender, EventArgs e)
        {
            // אתחול משתמש ↓
            Session["user"] = "אורח"; 
            Session["admin"] = false;
            Application["counter"] = (int)Application["counter"] + 1; // הגדלת מונה מספר המשתמשים באתר ב-1
        }
        void Session_End(object sender, EventArgs e)
        {
            Session["user"] = "אורח";
            Session["admin"] = false;
            Application["counter"] = (int)Application["counter"] - 1; // הקטנת מונה מספר המשתמשים באתר ב-1
        }
    }
}