using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApp1
{
    public partial class AnaMenu : Form
    {
        public AnaMenu()
        {
            InitializeComponent();
        }

        //SqlConnection conn = new SqlConnection("Server=215-18\\SQLEXPRESS;Database=Hastane;uid=SA;pwd=Ibb2022#!;");
        SqlConnection conn = new SqlConnection("Server=DESKTOP-76I04D2\\SQLEXPRESS;Database=Hastane;Integrated Security=true");

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Poliklinik poli = new Poliklinik();
            poli.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Doktorlar doktor = new Doktorlar();
            doktor.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Hastalar hasta = new Hastalar();
            hasta.Show();
            this.Hide();
        }

        private void AnaMenu_Load(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Raporlama rapo = new Raporlama();
            rapo.Show();
            this.Hide();
        }
    }
}
