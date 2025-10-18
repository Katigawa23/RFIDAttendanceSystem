using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RFIDAttendancesSystem_Morte_.database
{
    public class DatabaseConnector
    {
       public string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;


        public string GetConnection()
        {
            return connectionString ?? string.Empty;
        }
    }
}
