using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
using System.Windows.Shapes;
using TechnoService3.DBStorage;
using TechnoService3.ViewModel;

namespace TechnoService3.View
{
    /// <summary>
    /// Логика взаимодействия для AddEditWindow.xaml
    /// </summary>
    public partial class AddEditWindow : Window
    {
        private AuthVM _authVM;
        private Request _request;
        private List<Fault> _faults;
        public AddEditWindow(AuthVM authVM, Request request)
        {
            InitializeComponent();

            foreach (var item in App.Current.Windows)
            {
                if (item is AllRequestsWindow)
                    this.Owner = item as Window;
            }

            if (request == null)
            {
                _request = new Request();
            }
            else
            {
                _request = request;
            }

            _authVM = authVM;
            _request.ApplicantId = authVM.Id;
            _request.DateAdded = DateTime.Now;
            _request.StatusId = 1;

            this.DataContext = _request;

            LoadFaults();
        }

        public void LoadFaults()
        {
            using (var db = new TechnoEntities())
            {
                _faults = db.Fault.ToList();
                FaultTypeComboBox.ItemsSource = _faults;
            }
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new TechnoEntities())
            {
                try
                {
                    db.Request.AddOrUpdate(_request);
                    db.SaveChanges();
                    (Owner as AllRequestsWindow).RefreshData();
                    Owner.Focus();
                    MessageBox.Show("Данные успешно сохранены","Сохранение",MessageBoxButton.OK,MessageBoxImage.Information);
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Во время сохранения произошла ошибка\n{ex}","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
                }
            }
        }
    }
}
