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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //SqlConnection conn = new SqlConnection("Server=215-18\\SQLEXPRESS;Database=Hastane;uid=SA;pwd=Ibb2022#!;");
        SqlConnection conn = new SqlConnection("Server=DESKTOP-76I04D2\\SQLEXPRESS;Database=Hastane;Integrated Security=true");

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void button1_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand(); //ado.net ktüphanesine bağlanıp classları kllanarak server a bağlanıyoruz
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.CommandText = "Giris"; //prosedur ismi
            cmd.Parameters.AddWithValue("kad", textBox1.Text); //procedure yazdığımız parametreleri yazıyoruz
            cmd.Parameters.AddWithValue("Sifre", textBox2.Text);

            conn.Open();
            SqlDataReader dr; //sql deki dataları oku   
            dr = cmd.ExecuteReader(); //tek tek satır satır çalıştırırken oku 

            if (dr.Read()) // eğer okuyabiliyorsan gir
            {
                MessageBox.Show("Tebrikler! Başarılı Bir Şekilde Giriş Yaptınız.");
                AnaMenu git = new AnaMenu();
                git.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı Adınız veya Şifreniz Hatalı. Kontrol ediniz.");
                textBox1.Clear();
                textBox2.Clear();
            }
            conn.Close();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KEkle";
            cmd.Parameters.AddWithValue("KullaniciAd", textBox4.Text);
            cmd.Parameters.AddWithValue("KullaniciSifre", textBox3.Text);
            cmd.Parameters.AddWithValue("KullaniciMail", textBox6.Text);
            cmd.Parameters.AddWithValue("KullaniciTelefon", textBox5.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Kayıt Oldunuz. Tebrikler.");
            AnaMenu ana = new AnaMenu();
            ana.Show();
            this.Hide();
        }
    }
}
