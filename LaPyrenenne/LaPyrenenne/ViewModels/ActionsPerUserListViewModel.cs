using LaPyrenenne.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace LaPyrenenne.ViewModels
{
    class ActionsPerUserListViewModel : ViewModelBase
    {
        private ObservableCollection<ActionEnCoursViewModel> _listeActionsParUser = new ObservableCollection<ActionEnCoursViewModel>();
        private List<Salarie_Action> _listSalarie_Action = new List<Salarie_Action>();
        private List<ActionQSE> _listActionQSE = new List<ActionQSE>();



        private readonly ICollectionView _collectionView;
        //public int NbItemsMax { get; set; } = 0;
        //public int NbItemsCharges { get; set; } = 0;


        public ActionsPerUserListViewModel(string role)
        {
            //ClientServer clientServer = ClientServer.GetMyInstance();
            BuildList(role);

            //Définition de la collection view
            _collectionView = CollectionViewSource.GetDefaultView(_listeActionsParUser);
            if (_collectionView == null)
            {
                throw new NullReferenceException("collectionView");
            }

            /**** ABONNEMENTS ****/
            //_collectionView.CurrentChanged += OnCollectionViewCurrentChanged;// Abonnement a l'event de changement de focus, envoyé par l'observateur de liste
            //ClientViewModel.ClientSaved += AddClientToList;
            //ClientViewModel.EventNewClient += AddNewEmptyClient;
            //ClientViewModel.EventCommandCancel += CancelEmptyClient;
            //ClientViewModel.EventCommandDelete += DeleteClient;
        }

        public void BuildList(string role)
        {
            using (LapyrEntities dataAccess = new LapyrEntities())
            {
                //Recup des ID actions rattachées au USER de l'appli via la table d'association "Salarie_Action", ou il tient le role de créateur
                _listSalarie_Action = dataAccess.Salarie_Action.Where(sa => sa.idSalarie == 1 && sa.type.Equals(role)).ToList();
                
                //Pour chaque id de'actions attachées au USER, on recup l'action en elle-meme
                foreach (Salarie_Action item in _listSalarie_Action)
                {
                    _listActionQSE = dataAccess.ActionQSEs.Where(a => a.idAction == item.idAction).ToList();
                }

                //Pour chaque actions récupérées, on instancie un viewModel d'action 
                foreach(ActionQSE item in _listActionQSE)
                {
                    _listeActionsParUser.Add(new ActionEnCoursViewModel(item));
                }
            }
        }

        public ObservableCollection<ActionEnCoursViewModel> ListeActions
        {
            get
            {
                return _listeActionsParUser;
            }
        }

        //public ClientViewModel ClientSelected
        //{
        //    get
        //    {
        //        if (_collectionView == null) return null;
        //        if (!ListeClients.Any())
        //        {
        //            return new ClientViewModel(new Client());
        //        }
        //        if (_collectionView.CurrentItem == null) return null;


        //        return (ClientViewModel)_collectionView.CurrentItem;
        //    }
        //}

        ///**** METHODS LIEES AUX EVENTS ****/
        //public void OnCollectionViewCurrentChanged(object sender, EventArgs e)// Attachée a la commande de l'observateur de vue _collectionView
        //{
        //    NotifyPropertyChanged("ClientSelected");
        //}

        //private void AddClientToList(object sender, EventArgs e)
        //{
        //    _ListeClient.Add((ClientViewModel)sender);
        //}

        //private void AddNewEmptyClient(object sender, EventArgs e)
        //{
        //    _ListeClient.Add((ClientViewModel)sender);
        //}

        //private void CancelEmptyClient(object sender, EventArgs e)
        //{
        //    _ListeClient.RemoveAt(_ListeClient.Count - 1);
        //}

        //private void DeleteClient(object sender, EventArgs e)
        //{
        //    _ListeClient.Remove((ClientViewModel)sender);
        //}
    }
}
