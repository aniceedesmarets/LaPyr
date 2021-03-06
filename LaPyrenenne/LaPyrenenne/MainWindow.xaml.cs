﻿using LaPyrenenne.Models;
using LaPyrenenne.ViewModels;
using LaPyrenenne.ViewModels.Reglementation;
using LaPyrenenne.Views;
using LaPyrenenne.Views.Reglementation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LaPyrenenne
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();            
        }

        private void DisplayListActions_Click(object sender, RoutedEventArgs e)
        {
            ListeActionsParUser listActionView = new ListeActionsParUser();
            listActionView.DataContext = new ActionsPerUserListViewModel("CREATEUR");

            this.contentControl.Content = listActionView;
        }

        private void DisplayReglementation_Click(object sender, RoutedEventArgs e)
        {
            PageReglementation pageReglementationView = new PageReglementation();
            pageReglementationView.DataContext = new ActionsReglementationViewModel();

            this.contentControl.Content = pageReglementationView;
        }
    }
}
