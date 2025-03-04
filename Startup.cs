using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WebsiteBanHang.StartupOwin))]

namespace WebsiteBanHang
{
    public partial class StartupOwin
    {
        public void Configuration(IAppBuilder app)
        {
            //AuthStartup.ConfigureAuth(app);
        }
    }
}
