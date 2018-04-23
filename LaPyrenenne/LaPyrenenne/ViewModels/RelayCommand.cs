using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaPyrenenne.ViewModels
{
    class RelayCommand : System.Windows.Input.ICommand
    {
        private readonly Action _execute;
        private readonly Action<object> _executeP;

        private readonly Func<bool> _canExecute;
        public void Execute(object parameter)
        {
            if (_execute != null)
            {
                _execute();
            }
            else if (_executeP != null)
            {
                _executeP(parameter);
            }
        }

        public bool CanExecute(object parameter)
        {
            if (_canExecute == null)
                return true;
            return _canExecute();
        }

        //Evenement customisé pour abonner la méthode _canExecute à la notofication du changement (sinon les commandes client ne seront pas alertés !)
        public event EventHandler CanExecuteChanged
        {
            add
            {
                if (_canExecute != null)
                {
                    System.Windows.Input.CommandManager.RequerySuggested += value;
                }
            }
            remove
            {
                if (_canExecute != null)
                {
                    System.Windows.Input.CommandManager.RequerySuggested -= value;
                }
            }
        }
        //Initialisation de la commande avec les vraies fonctions à appeller !
        public RelayCommand(Action pexecute)
        {
            _execute = pexecute;
            _canExecute = null;
        }

        public RelayCommand(Action pexecute, Func<bool> pcanExecute)
        {
            _execute = pexecute;
            _canExecute = pcanExecute;
        }

        //Initialisation de la commande avec les vraies fonctions à appeller, avec paramètres !
        public RelayCommand(Action<object> pexecuteP)
        {
            _executeP = pexecuteP;
            _canExecute = null;
        }

        public RelayCommand(Action<object> pexecuteP, Func<bool> pcanExecute)
        {
            _executeP = pexecuteP;
            _canExecute = pcanExecute;
        }
    }
}
