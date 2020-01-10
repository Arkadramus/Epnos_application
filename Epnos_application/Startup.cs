using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Epnos_application.Startup))]
namespace Epnos_application
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
