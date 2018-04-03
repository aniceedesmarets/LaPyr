namespace LaPyrenenne.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BddLiaison : DbContext
    {
        public BddLiaison()
            : base("name=BddLiaison")
        {
        }

        public virtual DbSet<Action> Actions { get; set; }
        public virtual DbSet<Action_Tache> Action_Tache { get; set; }
        public virtual DbSet<Alerte> Alertes { get; set; }
        public virtual DbSet<Analyse> Analyses { get; set; }
        public virtual DbSet<Categorie> Categories { get; set; }
        public virtual DbSet<Detection> Detections { get; set; }
        public virtual DbSet<Famille> Familles { get; set; }
        public virtual DbSet<QSE> QSEs { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<Reglementation> Reglementations { get; set; }
        public virtual DbSet<Salarie_Action> Salarie_Action { get; set; }
        public virtual DbSet<Site> Sites { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Tache> Taches { get; set; }
        public virtual DbSet<Verification> Verifications { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Action>()
                .Property(e => e.pieceJustificative)
                .IsUnicode(false);

            modelBuilder.Entity<Action>()
                .HasMany(e => e.Action1)
                .WithOptional(e => e.Action2)
                .HasForeignKey(e => e.idAction_1);

            modelBuilder.Entity<Action>()
                .HasMany(e => e.Action_Tache)
                .WithRequired(e => e.Action)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Action>()
                .HasMany(e => e.Salarie_Action)
                .WithRequired(e => e.Action)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Action>()
                .HasMany(e => e.Verifications)
                .WithOptional(e => e.Action)
                .HasForeignKey(e => e.idAction);

            modelBuilder.Entity<Action>()
                .HasMany(e => e.Alertes)
                .WithMany(e => e.Actions)
                .Map(m => m.ToTable("Action_Alerte").MapLeftKey("idAction").MapRightKey("idAlerte"));

            modelBuilder.Entity<Action_Tache>()
                .Property(e => e.detail)
                .IsUnicode(false);

            modelBuilder.Entity<Alerte>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Analyse>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Analyse>()
                .Property(e => e.conclusion)
                .IsUnicode(false);

            modelBuilder.Entity<Analyse>()
                .HasMany(e => e.Detections)
                .WithOptional(e => e.Analyse)
                .HasForeignKey(e => e.idAnalyse);

            modelBuilder.Entity<Categorie>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Detection>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Detection>()
                .Property(e => e.detail)
                .IsUnicode(false);

            modelBuilder.Entity<Detection>()
                .HasMany(e => e.Analyses)
                .WithOptional(e => e.Detection)
                .HasForeignKey(e => e.idDetection);

            modelBuilder.Entity<Detection>()
                .HasMany(e => e.Reglementations)
                .WithMany(e => e.Detections)
                .Map(m => m.ToTable("Detection_Reglementation").MapLeftKey("idDetection").MapRightKey("idReglementation"));

            modelBuilder.Entity<Famille>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.statutHierarchique)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.tel)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.prenom)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.identifiant)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .Property(e => e.mdp)
                .IsUnicode(false);

            modelBuilder.Entity<QSE>()
                .HasMany(e => e.Salarie_Action)
                .WithRequired(e => e.QSE)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Question>()
                .Property(e => e.question1)
                .IsUnicode(false);

            modelBuilder.Entity<Question>()
                .Property(e => e.detail)
                .IsUnicode(false);

            modelBuilder.Entity<Question>()
                .HasMany(e => e.Verifications)
                .WithMany(e => e.Questions)
                .Map(m => m.ToTable("Verification_Question").MapLeftKey("idQuestion").MapRightKey("idVerification"));

            modelBuilder.Entity<Reglementation>()
                .Property(e => e.designation)
                .IsUnicode(false);

            modelBuilder.Entity<Reglementation>()
                .Property(e => e.lien)
                .IsUnicode(false);

            modelBuilder.Entity<Salarie_Action>()
                .Property(e => e.type)
                .IsUnicode(false);

            modelBuilder.Entity<Site>()
                .Property(e => e.nomSite)
                .IsUnicode(false);

            modelBuilder.Entity<Tache>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Tache>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Tache>()
                .HasMany(e => e.Action_Tache)
                .WithRequired(e => e.Tache)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Verification>()
                .HasMany(e => e.Actions)
                .WithOptional(e => e.Verification)
                .HasForeignKey(e => e.idVerification);
        }
    }
}
