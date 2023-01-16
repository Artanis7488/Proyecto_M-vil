using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaFractal.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }


        DAL dal = new DAL();

        [HttpPost]
        [Route("Login")]
        public ObjectResult Login(LoginModel model)
        {
            Empleado empleado = dal.Login(model.username, model.contrasena);

            return Ok(empleado);
        }

        [HttpPost]
        [Route("Register")]
        public ObjectResult Register(Empleado empleado)
        {
            bool success = dal.Register(empleado); //recive un empleado y lo inserta
            return Ok(success);
        }
    }

    public class LoginModel
    {
        public string username { get; set; }
        public string contrasena { get; set; }
    }
}