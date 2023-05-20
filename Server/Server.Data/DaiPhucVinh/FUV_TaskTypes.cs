﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DaiPhucVinh.Server.Data.DaiPhucVinh
{
    [Table("FUV_TaskTypes")]
    public class FUV_TaskTypes
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
    }
}
