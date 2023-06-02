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
    public partial class Poliklinik : Form
    {
        public Poliklinik()
        {
            InitializeComponent();
        }
        //SqlConnection conn = new SqlConnection("Server=215-18\\SQLEXPRESS;Database=Hastane;uid=SA;pwd=Ibb2022#!;");
        SqlConnection conn = new SqlConnection("Server=DESKTOP-76I04D2\\SQLEXPRESS;Database=Hastane;Integrated Security=true");

        private void poliklinklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Poliklinik poli = new Poliklinik ();
            poli.Show();
            this.Hide();
        }

        private void doktorlarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Doktorlar doktor = new Doktorlar();
            doktor.Show();
            this.Hide();
        }

        private void hastalarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Hastalar hasta = new Hastalar();
            hasta.Show();
            this.Hide();
        }

        private void Poliklinik_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        public void Listeleme()
        {
            dataGridView1.Visible = true;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PListele";
            SqlDataAdapter dr = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
           
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["PNo"].Value.ToString();
            textBox1.Text = row.Cells["PoliAd"].Value.ToString();
            textBox2.Text = row.Cells["PoliBaskan"].Value.ToString();
            textBox3.Text = row.Cells["PoliHemsire"].Value.ToString();
            textBox4.Text = row.Cells["YatakSayisi"].Value.ToString();
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem == "Ad")
            {
                dataGridView1.Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PAdAra";
                cmd.Parameters.AddWithValue("PoliAd", textBox6.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
            }
            else if (comboBox1.SelectedItem == "No")
            {
                dataGridView1.Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PNoAra";
                cmd.Parameters.AddWithValue("PNo", textBox6.Text);
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
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PEkle";
            cmd.Parameters.AddWithValue("PoliAd", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliBaskan", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliHemsire", textBox3.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox4.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PYenile";
            cmd.Parameters.AddWithValue("PNo", textBox1.Tag);
            cmd.Parameters.AddWithValue("PoliAd", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliBaskan", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliHemsire", textBox3.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox4.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSil";
            cmd.Parameters.AddWithValue("PNo", textBox1.Tag);
            cmd.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void raporlamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Raporlama raporlama = new Raporlama();
            raporlama.Show();
            this.Hide();
        }
    }
}
