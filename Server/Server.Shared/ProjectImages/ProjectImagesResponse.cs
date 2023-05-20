﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DaiPhucVinh.Shared.ProjectImages
{
    public class ProjectImagesResponse
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ShortTitle { get; set; }
        public string Description { get; set; }
        public string Images { get; set; }
        public string UpdatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public List<object> ImageList { get; set; }
    }
}
