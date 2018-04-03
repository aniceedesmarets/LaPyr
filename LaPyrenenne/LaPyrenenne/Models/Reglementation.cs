namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reglementation")]
    public partial class Reglementation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reglementation()
        {
            Detections = new HashSet<Detection>();
        }

        [Key]
        public int idReglementation { get; set; }

        [StringLength(200)]
        public string designation { get; set; }

        [StringLength(200)]
        public string lien { get; set; }

        public int? idCategorie { get; set; }

        public virtual Categorie Categorie { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detection> Detections { get; set; }
    }
}
