namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Analyse")]
    public partial class Analyse
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Analyse()
        {
            Detections = new HashSet<Detection>();
        }

        [Key]
        public int idAnalyse { get; set; }

        [StringLength(200)]
        public string description { get; set; }

        [StringLength(200)]
        public string conclusion { get; set; }

        public int? idDetection { get; set; }

        public virtual Detection Detection { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detection> Detections { get; set; }
    }
}
