using Microsoft.EntityFrameworkCore;
using EFTest.Models;
namespace EFTest.Data
{
    public class SchoolContent : DbContext
    {
        public SchoolContent(DbContextOptions<SchoolContent> options) : base(options)
        {
        }

        public DbSet<Student> Students { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student>().ToTable("Student");
        }
    }
}
