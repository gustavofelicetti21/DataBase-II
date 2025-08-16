using Greenhouse.Models;

namespace Greenhouse.Data
{
    public class DBInitializer
    {
        public static void Initialize(GreenhouseContext context)
        {
            context.Database.EnsureCreated();

            // Look for any students.
            if (context.Plants.Any())
            {
                return;   // DB has been seeded
            }

            context.SaveChanges();
        }
    }
}
