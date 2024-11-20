using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class PreguntaEntity: BaseEntity
    {
        // public string competenciaEvaluar { get; set; }  por ahora no estara en el demo. estas son las competencias que se evaluan como enseñar, formar, etc.
        public int tipoCompetencia { get; set; }  //competencias ciudadanas, raconamiento cuantitativo...  no comunicacion escrita mas adelante con ia
        public int complejidad { get; set; }  //1 =baja, 2 = media, 3 = alta
        public int tipoPregunta { get; set; }  //texto - texto, imagen - texto, texto -imagen, imagen - imagen. el de complete y relacione para el demo no
    }
}