namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tache")]
    public partial class Tache
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tache()
        {
            Action_Tache = new HashSet<Action_Tache>();
        }

        [Key]
        public int idTache { get; set; }

        [StringLength(50)]
        public string nom { get; set; }

        [StringLength(200)]
        public string description { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Action_Tache> Action_Tache { get; set; }
    }
}
