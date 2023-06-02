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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }

        //SqlConnection conn = new SqlConnection("Server=215-18\\SQLEXPRESS;Database=Hastane;uid=SA;pwd=Ibb2022#!;");
        SqlConnection conn = new SqlConnection("Server=DESKTOP-76I04D2\\SQLEXPRESS;Database=Hastane;Integrated Security=true");

        private void poliklinklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Poliklinik poli = new Poliklinik();
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

        public void Listeleme()
        {
            dataGridView1.Visible = true;
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HListele";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
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

        private void Hastalar_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["HastaNo"].Value.ToString();
            textBox1.Text = row.Cells["HastaAdSoyad"].Value.ToString();
            textBox2.Text = row.Cells["HastaTC"].Value.ToString();
            dateTimePicker1.Text = row.Cells["HastaDogumTarihi"].Value.ToString();
            dateTimePicker2.Text = row.Cells["RandevuTime"].Value.ToString();
            textBox5.Text = row.Cells["DoctorNo"].Value.ToString();
            textBox3.Text = row.Cells["Reçete"].Value.ToString();


        }

        private void pictureBox6_Click(object sender, EventArgs e)
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
                cmd.CommandText = "HAdAra";
                cmd.Parameters.AddWithValue("HastaAdSoyad", textBox6.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
            }
            else if (comboBox1.SelectedItem == "TC")
            {
                dataGridView1.Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HTCAra";
                cmd.Parameters.AddWithValue("HastaTC", textBox6.Text);
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
            komut.CommandText = "HEkle";
            komut.Parameters.AddWithValue("HastaAdSoyad", textBox1.Text);
            komut.Parameters.AddWithValue("HastaTC", textBox2.Text);
            komut.Parameters.AddWithValue("HastaDogumTarihi",Convert.ToDateTime(dateTimePicker1.Text));
            komut.Parameters.AddWithValue("RandevuTime", Convert.ToDateTime(dateTimePicker2.Text));
            komut.Parameters.AddWithValue("DoctorNo", textBox5.Text);
            komut.Parameters.AddWithValue("Reçete", textBox3.Text);
            komut.Parameters.AddWithValue("PNo", textBox4.Text);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HYenile";
            cmd.Parameters.AddWithValue("HastaNo", textBox1.Tag);
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("HastaTC", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaDogumTarihi", Convert.ToDateTime(dateTimePicker1.Text));
            cmd.Parameters.AddWithValue("RandevuTime", Convert.ToDateTime(dateTimePicker2.Text));
            cmd.Parameters.AddWithValue("DoctorNo", textBox5.Text);
            cmd.Parameters.AddWithValue("Reçete", textBox3.Text);
            cmd.Parameters.AddWithValue("PNo", textBox4.Text);
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
            cmd.CommandText = "HSil";
            cmd.Parameters.AddWithValue("HastaNo", textBox1.Tag);
            cmd.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void raporlamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Raporlama raporlama = new Raporlama();
            raporlama.Show();
            this.Hide();
        }
    }
}
