namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Detection")]
    public partial class Detection
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Detection()
        {
            Analyses = new HashSet<Analyse>();
            Reglementations = new HashSet<Reglementation>();
        }

        [Key]
        public int idDetection { get; set; }

        [StringLength(50)]
        public string nom { get; set; }

        [StringLength(200)]
        public string detail { get; set; }

        public int? idAction { get; set; }

        public int? idAnalyse { get; set; }

        public virtual Action Action { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Analyse> Analyses { get; set; }

        public virtual Analyse Analyse { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reglementation> Reglementations { get; set; }
    }
}
