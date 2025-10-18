using RFIDAttendancesSystem_Morte_.database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RFIDAttendancesSystem_Morte_.dashboard
{
    public partial class AddUser : Form
    {
        private static DatabaseConnector connector = new DatabaseConnector();
        public string connectionString = connector.GetConnection();
        public AddUser()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void AddUser_Load(object sender, EventArgs e)
        {

        }

        public void SaveRecords()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString)) 
                using (SqlCommand command = new SqlCommand("SaveRecords ", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", tbUserId.Text);
                    command.Parameters.AddWithValue("@first_name", tbFirstname.Text);
                    command.Parameters.AddWithValue("@middle_name", tbMiddlename.Text);
                    command.Parameters.AddWithValue("@last_name", tbLastname.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    MessageBox.Show("Succecfully inserted records");
                }
            }
            catch
            {
                throw;
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            SaveRecords();
        }
    }
}
