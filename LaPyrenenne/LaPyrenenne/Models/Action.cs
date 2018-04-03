namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Action")]
    public partial class Action
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Action()
        {
            Action1 = new HashSet<Action>();
            Action_Tache = new HashSet<Action_Tache>();
            Detections = new HashSet<Detection>();
            Salarie_Action = new HashSet<Salarie_Action>();
            Verifications = new HashSet<Verification>();
            Alertes = new HashSet<Alerte>();
        }

        [Key]
        public int idAction { get; set; }

        public DateTime? dateDebut { get; set; }

        public double? delais { get; set; }

        public double? acheve { get; set; }

        public int? numeroImportance { get; set; }

        public DateTime? dateFin { get; set; }

        [StringLength(50)]
        public string pieceJustificative { get; set; }

        public int? idFamille { get; set; }

        public int? idVerification { get; set; }

        public int? idSite { get; set; }

        public int? idAction_1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Action> Action1 { get; set; }

        public virtual Action Action2 { get; set; }

        public virtual Famille Famille { get; set; }

        public virtual Site Site { get; set; }

        public virtual Verification Verification { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Action_Tache> Action_Tache { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detection> Detections { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Salarie_Action> Salarie_Action { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Verification> Verifications { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Alerte> Alertes { get; set; }
    }
}
