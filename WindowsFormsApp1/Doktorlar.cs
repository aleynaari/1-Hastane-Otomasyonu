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
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }
        //SqlConnection conn = new SqlConnection("Server=215-18\\SQLEXPRESS;Database=Hastane;uid=SA;pwd=Ibb2022#!;");
        SqlConnection conn = new SqlConnection("Server=DESKTOP-76I04D2\\SQLEXPRESS;Database=Hastane;Integrated Security=true");

        public void Listeleme()
        {
            dataGridView1.Visible = true;
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DListele";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void hastalarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Hastalar hasta = new Hastalar();
            hasta.Show();
            this.Hide();
        }

        private void doktorlarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Doktorlar doktor = new Doktorlar();
            doktor.Show();
            this.Hide();
        }

        private void poliklinklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Poliklinik poli = new Poliklinik();
            poli.Show();
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
          
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
          
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
         
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            
        }

        private void Doktorlar_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["DNo"].Value.ToString();
            textBox1.Text = row.Cells["DAdSoyad"].Value.ToString();
            textBox3.Text = row.Cells["UzmanAlan"].Value.ToString();
            textBox4.Text = row.Cells["PoliNo"].Value.ToString();

        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
           
        }

        private void pictureBox6_Click_1(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem == "AdSoyad")
            {
                dataGridView1.Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DAdAra";
                cmd.Parameters.AddWithValue("DAdSoyad", textBox2.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
            }
            else if (comboBox1.SelectedItem == "Numara")
            {
                dataGridView1.Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DNoAra";
                cmd.Parameters.AddWithValue("DNo", textBox2.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Listeleme();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DEkle";
            komut.Parameters.AddWithValue("DAdSoyad", textBox1.Text);
            komut.Parameters.AddWithValue("UzmanAlan", textBox3.Text);
            komut.Parameters.AddWithValue("PoliNo", textBox4.Text);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DYenile";
            komut.Parameters.AddWithValue("DNo", textBox1.Tag);
            komut.Parameters.AddWithValue("DAdSoyad", textBox1.Text);
            komut.Parameters.AddWithValue("UzmanAlan", textBox3.Text);
            komut.Parameters.AddWithValue("PoliNo", textBox4.Text);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DSil";
            komut.Parameters.AddWithValue("DNo", textBox1.Tag);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void raporlamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Raporlama raporlama = new Raporlama();
            raporlama.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
