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
            txtdis.Text += " +";
        }

        private void btnsub_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += " -";
        }

        private void btnmul_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += " *";
        }

        private void btndiv_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += " /";
        }

        private void btn00_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += "00";
        }

        private void btnpoint_Click(object sender, RoutedEventArgs e)
        {
            txtdis.Text += '.';
        }

        private void btnresult_Click(object sender, RoutedEventArgs e)
        {
            string infix_expression = txtdis.Text;
            if (infix_expression != "" && !(".+*/-").Contains(infix_expression[0]) && !(".+*/-").Contains(infix_expression[infix_expression.Length-1]))
            {
                string postfix_expression = Postfix(infix_expression);
                double result = operation(postfix_expression);
                txtdis.Text = Convert.ToString(result);
            }
            else
            {
                txtdis.Text = "Invalid";
            }
        }
        private string Postfix(string expression)
        {
            string P = "";
            expression += ')';
            Stack<char> stack = new Stack<char>();
            stack.Push('(');
            foreach (char ch in expression)
            {
                switch (ch)
                {
                    case '(':
                        stack.Push('(');
                        break;

                    case ')':
                        while (stack.Count > 0 && stack.Peek() != '(')
                        {
                            P += ' ';
                            P += stack.Pop();
                            P += ' ';
                        }
                        stack.Pop();
                        break;
                    case '/':
                    case '*':
                        while (stack.Peek() == '/' || stack.Peek() == '*')
                        {
                            P += stack.Pop();
                            P += ' ';
                        }
                        stack.Push(ch);
                        break;

                    case '+':
                    case '-':

                        while (stack.Peek() == '/' || stack.Peek() == '*' || stack.Peek() == '+' || stack.Peek() == '-')
                        {
                            P += stack.Pop();
                            P += ' ';
                        }
                        stack.Push(ch);
                        break;
                    case '.':
                        P = P.TrimEnd();
                        P += ch;
                        break;
                    default:
                        P += ch;
                        break;
                }
            }
            return P;
        }
       private double operation(string expression)
        {
            expression = expression.Trim();
            string[] notation = expression.Split(' ');
            Stack<double> stack = new Stack<double>();
            double result,op1,op2,res;
            foreach(string ch in notation)
            {
                switch(ch)
                {
                    case "/":
                            op1 = stack.Pop();
                            op2 = stack.Pop();
                            res = op2 / op1;
                            stack.Push(res);
                            break;
                    case "*":
                            op1 = stack.Pop();
                            op2 = stack.Pop();
                            res = op2 * op1;
                            stack.Push(res);
                            break;
                    case "+":
                            op1 = stack.Pop();
                            op2 = stack.Pop();
                            res = op2 + op1;
                            stack.Push(res);
                            break;
                    case "-":
                            op1 = stack.Pop();
                            op2 = stack.Pop();
                            res = op2 - op1;
                            stack.Push(res);
                            break;
                    case "" :
                            break;
                    default:
                            
                            stack.Push(Convert.ToDouble(ch));
                            break;
                }
            }
            result = stack.Peek();
            return result;
        }
    }
}
