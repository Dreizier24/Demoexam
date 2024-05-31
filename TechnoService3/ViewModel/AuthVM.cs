using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TechnoService3.DBStorage;
using TechnoService3.View;

namespace TechnoService3.ViewModel
{
    public class AuthVM : BaseViewModel
    {
        private User _user;
        public User User
        {
            get => _user;
            set
            {
                _user = value;
                OnPropertyChanged(nameof(User));
            }
        }

        private string _login;
        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }

        private string _password;
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        private int? _postId;
        public int? PostId
        {
            get => _postId;
            set
            {
                _postId = value;
                OnPropertyChanged(nameof(PostId));
            }
        }

        private int _id;
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged(nameof(Id));
            }
        }

        private bool _isAutheticated;
        public bool IsAutheticated
        {
            get => _isAutheticated;
            set
            {
                _isAutheticated = value;
                OnPropertyChanged(nameof(IsAutheticated));
            }
        }


        private bool Authorization(string login, string password)
        {
            using (var db = new TechnoEntities())
            {
                var res = db.User.FirstOrDefault(e => e.Login ==  login && e.Password == password);

                if (res!=null)
                {
                    _user = res;
                    _id = res.Id;
                    _postId = res.PostId;
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public void AuthInApp()
        {
            var res = Authorization(Login, Password);

            if (res)
            {
                IsAutheticated = true;

                if (PostId == 3)
                {
                    AllRequestsWindow arw = new AllRequestsWindow(this);
                    arw.Show();
                }
                else
                {
                    MainWindow mw = new MainWindow(this);
                    mw.Show();
                }
            }
            else
            {
                MessageBox.Show("Во время авторизации произошла ошибка","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}
