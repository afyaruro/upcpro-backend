using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class UserEntity : BaseEntity
    {
        public string emailUser { get; set; }
        public string passwordUser { get; set; }
        public string tipoUser { get; set; }
        public bool estado { get; set; }
        public string imagen { get; set; }



    }
}