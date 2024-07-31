using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;
using System.Net;

namespace Negocio
{
    public class NegocioAdmin
    {
        DaoAdmin dao = new DaoAdmin();

        public DataTable getTablaCompleta()
        {
            return dao.getTablaAdmin();
        }
        public DataTable getSocio(Administrador admin)
        {
            return dao.getAdmin(admin);
        }

        public String getCeldaAdmin(String campo, Administrador admin)
        {
            return dao.getCeldaAdmin(campo, admin);
        }

        public void AgregarAdmin(Administrador admin)
        {
            DaoAdmin dao = new DaoAdmin();
            dao.AgregarAdmin(admin);
        }

        public bool existeDNI(int dni)
        {
            DaoAdmin dao = new DaoAdmin();
            return dao.existeDNI(dni);
        }
    }
}
