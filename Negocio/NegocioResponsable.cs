using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioResponsable
    {
        DaoResponsable datos = new DaoResponsable();
        public DataTable getTabla()
        {
            return datos.getTablaResponsable();
        }
        public DataTable getResponsable(Responsable resp)
        {
            return datos.getResponsable(resp);
        }

        public String getCeldaResponsable(String campo, Responsable resp)
        {
            return datos.getCeldaResponsable(campo, resp);
        }

        public int getIdPorDNI(int dni)
        {
            return datos.getId(dni);
        }
        public bool agregarResponsable(Responsable resp)
        {
            return datos.agregarResponsable(resp);
        }

        public Responsable infoRespoPorID(Responsable respo)
        {
            return datos.infoRespoPorID(respo);
        }

        public bool modificarResponsable(Responsable respo)
        {
            DaoResponsable dao = new DaoResponsable();
            return dao.modificarResponsable(respo);
        }

    }
}
