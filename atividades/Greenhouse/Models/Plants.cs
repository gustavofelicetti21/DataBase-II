using Microsoft.AspNetCore.Http.HttpResults;
using System.ComponentModel.DataAnnotations;

namespace Greenhouse.Models
{
    public class Plants
    {
        [Key]
        public int Id { get; set; }
        public string? PlantName { get; set; }
        public float? SensorValue { get; set; }
        public DateTime Sensor_Event { get; set; }
    }
}
