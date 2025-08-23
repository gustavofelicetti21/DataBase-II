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
            var plants = new Plants[]
            {
                new Plants{PlantName="Flor Azul",SensorValue=10,Sensor_Event=DateTime.Parse("2005-09-01")},
                new Plants{PlantName="Lírio Amarelo",SensorValue=35,Sensor_Event=DateTime.Parse("2005-11-15")},
                new Plants{PlantName="Rosa Vermelha",SensorValue=31,Sensor_Event=DateTime.Parse("2005-11-23")},
                new Plants{PlantName="Orquídea Branca",SensorValue=37,Sensor_Event=DateTime.Parse("2005-09-27")},
                new Plants{PlantName="Jasmim",SensorValue=45,Sensor_Event=DateTime.Parse("2005-09-30")}
            };
            foreach (Plants p in plants)
            {
                context.Plants.Add(p);
            }
            context.SaveChanges();
        }
    }
}
