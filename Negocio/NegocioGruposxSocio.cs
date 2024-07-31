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
    public class NegocioGruposxSocio
    {
        DaoGruposxSocio dao = new DaoGruposxSocio();
        public DataTable getGruposAnotados(Socios socio)
        {
            return dao.getGruposAnotados(socio);
        }

        public void EliminarGrupoXSocio(int id)
        {
            dao.EliminarGrupo(id);
        }

        public Boolean Inscripto(Grupos grupo, Socios socio)
        {
            return dao.Inscripto(grupo, socio);
        }

        public bool agregarGrupoXSocio(Grupos grupo, Socios socio)
        {
            return dao.agregarGrupoXSocio(grupo, socio);
        }

        public DataTable getGruposPorID(Socios socio)
        {
            return dao.getGruposxID(socio);
        }
    }
}
