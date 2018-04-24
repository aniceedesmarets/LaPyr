using LaPyrenenne.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace LaPyrenenne.ViewModels
{
    class ActionEnCoursViewModel : ViewModelBase
    {
        // CONSTRUCTEUR DU CONTROLEUR AVEC L'ENTITE A CONTROLER
        private ActionQSE ActionQSE;

        public ActionEnCoursViewModel(ActionQSE _action)
        {
            this.ActionQSE = _action;
        }

        // PROPRIETE SUR L'ENTITE CONTROLEE
        public ActionQSE Action
        {
            get
            {
                return ActionQSE;
            }
        }
        
        #region Save Action
        /**** COMMAND SAVE NOUVEAU CLIENT ****/
        private RelayCommand _CommandeSave;
        public ICommand CommandSave
        {
            get
            {
                if (_CommandeSave == null)
                {
                    _CommandeSave = new RelayCommand(Save);
                }
                return _CommandeSave;
            }
        }
        /**** EVENT SAVE NOUVEAU CLIENT ****/
        public static event EventHandler ClientSaved;
        private void Save()
        {
            SaveClientBDD();
            ClientSaved(this, EventArgs.Empty);// Event ajout de nouveau client controller a la ClientListViewModel            
        }

        public void SaveClientBDD()
        {
            //ClientServer clientServer = ClientServer.GetMyInstance();
            //clientServer.SaveClient(this.Client);
        }
        #endregion

        #region Créer Action
        /**** COMMAND CREER NOUVEAU CLIENT ****/
        private RelayCommand _CommandCreerNouveauClient;
        public ICommand CommandCreerNouveauClient
        {
            get
            {
                if (_CommandCreerNouveauClient == null)
                {
                    _CommandCreerNouveauClient = new RelayCommand(CreerNouveauClient);
                }
                return _CommandCreerNouveauClient;
            }
        }
        /**** EVENT CREER NOUVEAU CLIENT ****/
        public static event EventHandler EventNewClient;
        private void CreerNouveauClient()
        {
            //EventNewClient(new ClientViewModel(new Client()), EventArgs.Empty);// Event ajout de nouveau client controller a la ClientListViewModel
        }
        #endregion

        #region Delete Action
        /**** COMMAND SUPPRIMER CLIENT ****/
        private RelayCommand _CommandDelete;
        public ICommand CommandDelete
        {
            get
            {
                if (_CommandDelete == null)
                {
                    _CommandDelete = new RelayCommand(DeleteClient);
                }
                return _CommandDelete;
            }
        }
        /**** EVENT SUPPRIMER CLIENT ****/
        public static event EventHandler EventCommandDelete;
        private void DeleteClient()
        {
            DeleteClientBDD();
            EventCommandDelete(this, EventArgs.Empty);// Event ajout de nouveau client controller a la ClientListViewModel
        }

        public void DeleteClientBDD()
        {
            //ClientServer clientServer = ClientServer.GetMyInstance();
            //clientServer.DeleteClient(this.Client);
        }
        #endregion

        #region Cancel Action
        /**** COMMAND ANNULER NOUVEAU CLIENT ****/
        private RelayCommand _CommandCancel;
        public ICommand CommandCancel
        {
            get
            {
                if (_CommandCancel == null)
                {
                    _CommandCancel = new RelayCommand(AnnulerNouveauClient);
                }
                return _CommandCancel;
            }
        }
        /**** EVENT ANNULER NOUVEAU CLIENT ****/
        public static event EventHandler EventCommandCancel;
        private void AnnulerNouveauClient()
        {
            EventCommandCancel(this, EventArgs.Empty);// Event ajout de nouveau client controller a la ClientListViewModel
        }
        #endregion





        
    }
}
