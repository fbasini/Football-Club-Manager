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
    public class NegocioSocios
    {
        DaoSocio dao = new DaoSocio();

        public DataTable getTablaCompleta()
        {
            return dao.getTablaSocios();
        }
        public DataTable getSocio(Socios socio)
        {
            return dao.getSocio(socio);
        }

        public Socios infoSocioPorID(Socios socio)
        {
            return dao.infoSocioPorID(socio);
        }

        public Socios getSocioPorUsuario(Usuarios user)
        {
            Socios socio = new Socios();
            socio = dao.getSocioPorUsuario(user);
            return socio;
        }

        public int getIDUsuarioSocio(int id_socio)
        {
            int id_user = dao.getIDUsuarioSocio(id_socio);
            return id_user;
        }

        public int getIDRespoSocio(int id_socio)
        {
            int id_respo = dao.getIDRespoSocio(id_socio);
            return id_respo;
        }

        public String getCeldaSocio(String campo, Socios socio)
        {
            return dao.getCeldaSocio(campo, socio);
        }

        public void EliminarSocio(Socios socios)
        {
            DaoSocio dao = new DaoSocio();
            dao.EliminarSocio(socios);
        }
        public bool agregarSocio(Socios socio)
        {
            DaoSocio dao = new DaoSocio();
            return dao.agregarSocio(socio);
        }
        public DataTable getTablaSociosFiltradosPorNombre(Socios socios)
        {
            return dao.getTablaSociosFiltradosPorNombre(socios);
        }

        public DataTable getTablaSociosFiltradosPorDni(Socios socios)
        {
            return dao.getTablaSociosFiltradosPorDni(socios);
        }

        public int buscarIdSocioPorDni(int dni)
        {
            return dao.buscarIdSocioPorDni(dni);
        }

        // si se elimina un socio tambien se tiene que eliminar de estas tablas
        public void EliminarRegistroGruposPorSocios(Socios socios)
        {
            DaoSocio dao = new DaoSocio();
            dao.EliminarRegistroGruposPorSocios(socios);
        }

        public void EliminarRegistroPagos(Socios socios)
        {
            DaoSocio dao = new DaoSocio();
            dao.EliminarRegistroPagos(socios);
        }
        ////////////////////////////////////
        
        public bool modificarSocio(Socios socios)
        {
            DaoSocio dao = new DaoSocio();
            return dao.modificarSocio(socios);
        }

        public bool existeId(int id)
        {
            DaoSocio dao = new DaoSocio();
            return dao.existeId(id);
        }

        public bool existeDNI(int dni)
        {
            DaoSocio dao = new DaoSocio();
            return dao.existeDNI(dni);
        }

        public bool esMenor(Socios socio)
        {
            DaoSocio dao = new DaoSocio();
            return dao.esMenor(socio);
        }

        public bool agregarIdResponsableAlSocio(Socios socio)
        {
            DaoSocio dao = new DaoSocio();
            return dao.agregarIdResponsableAlSocio(socio);
        }

        
    }
}
