namespace LaPyrenenne.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Question")]
    public partial class Question
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Question()
        {
            Verifications = new HashSet<Verification>();
        }

        [Key]
        public int idQuestion { get; set; }

        [Column("question")]
        [StringLength(100)]
        public string question1 { get; set; }

        [StringLength(200)]
        public string detail { get; set; }

        public double? pointOui { get; set; }

        public double? pointNon { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Verification> Verifications { get; set; }
    }
}
