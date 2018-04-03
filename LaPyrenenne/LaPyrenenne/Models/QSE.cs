namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QSE")]
    public partial class QSE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QSE()
        {
            Salarie_Action = new HashSet<Salarie_Action>();
        }

        [Key]
        public int idSalarie { get; set; }

        [StringLength(50)]
        public string nom { get; set; }

        [StringLength(50)]
        public string statutHierarchique { get; set; }

        [StringLength(100)]
        public string email { get; set; }

        [StringLength(10)]
        public string tel { get; set; }

        [StringLength(50)]
        public string prenom { get; set; }

        [StringLength(50)]
        public string identifiant { get; set; }

        [StringLength(50)]
        public string mdp { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Salarie_Action> Salarie_Action { get; set; }
    }
}
