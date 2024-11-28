using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace calculator
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        double no1, no2;
        char op;//operator
        string input;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }
        private void clearbtn_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text = String.Empty;
            no1 = no2 = 0;
        }
        private void btnclr_Click(object sender, RoutedEventArgs e)
        {
            string input = txtdis.Text;
            if(input != "")
            txtdis.Text =input.Remove(input.Length-1);
        }
        private void btn0_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "0";
        }
        private void btn1_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "1";
        }

        private void btn2_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "2";
        }

        private void btn3_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "3";
        }

        private void btn4_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "4";
        }

        private void btn5_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "5";
        }

        private void btn6_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "6";
        }

        private void btn7_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "7";
        }

        private void btn8_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "8";
        }

        private void btn9_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "9";
        }

        private void btnadd_Click(object sender, RoutedEventArgs e)
        {
            if (txtdis.Text != "")
            {
                no1 = Convert.ToDouble(txtdis.Text);
                op = '+';
                txtdis.Text = "";
            }
        }

        private void btnsub_Click(object sender, RoutedEventArgs e)
        {
            if (txtdis.Text != "")
            {
                no1 = Convert.ToDouble(txtdis.Text);
                op = '-';
                txtdis.Text = "";
            }
        }

        private void btnmul_Click(object sender, RoutedEventArgs e)
        {
            if (txtdis.Text != "")
            {
                no1 = Convert.ToDouble(txtdis.Text);
                op = '*';
                txtdis.Text = " ";
            }
        }

        private void btndiv_Click(object sender, RoutedEventArgs e)
        {
            if (txtdis.Text != "")
            {
                no1 = Convert.ToDouble(txtdis.Text);
                op = '/';
                txtdis.Text = " ";
            }
        }

        private void btn00_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "00";
        }

        private void btnresult_Click(object sender, RoutedEventArgs e)
        {
            if (txtdis.Text != "" )
            {
                no2 = Convert.ToDouble(txtdis.Text);
                double res = 0;
                switch (op)
                {
                    case '/':
                        res = no1 / no2;
                        break;
                    case '*':
                        res = no1 * no2;
                        break;
                    case '+':
                        res = no1 + no2;
                        break;
                    case '-':
                        res = no1 - no2;
                        break;
                }
                txtdis.Text = Convert.ToString(res);
            }
            else
            {
                txtdis.Text = "Invalid";
            }
        }

        private void btnpoint_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += ".";
        }
       
    }
}
