﻿using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaLogica
{
    public class logVisitas
    {
        private static readonly logVisitas _instancia = new logVisitas();
        public static logVisitas Instancia
        {
            get { return logVisitas._instancia; }
        }
        public DataTable ListarVisitas(int idLocalidad)
        {
            // Utiliza la instancia de datVisitas para obtener los datos, pasando el ID de la localidad
            return datVisitas.Instancia.ListarVisitas(idLocalidad);
        }
        public bool InsertarVisita(DateTime fechaVisita, bool estado, int idLocalidad, int idEmpleado)
        {
            return datVisitas.Instancia.InsertarVisita(fechaVisita, estado, idLocalidad, idEmpleado);
        }
        public bool ActualizarEstadoVisita(int idVisita, bool nuevoEstado)
        {
            return datVisitas.Instancia.ActualizarEstado(idVisita, nuevoEstado);
        }
        public bool ObtenerEstadoVisita(int idVisita)
        {
            return datVisitas.Instancia.ObtenerEstadoVisita(idVisita);
        }

        public string ObtenerNombreCompletoEmpleadoPorIdLocalidad(int idLocalidad)
        {
            try
            {
                return datVisitas.Instancia.ObtenerNombreCompletoEmpleadoPorIdLocalidad(idLocalidad);
            }
            catch (Exception ex)
            {
                // Manejar la excepción apropiadamente (p. ej. registrándola, lanzándola nuevamente, mostrando un mensaje de error, etc.)
                throw new Exception("Error al obtener el nombre completo del empleado por ID de la localidad desde logVisitas", ex);
            }
        }
    }
}
