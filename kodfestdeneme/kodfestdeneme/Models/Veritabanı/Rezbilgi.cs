//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace kodfestdeneme.Models.Veritabanı
{
    using System;
    using System.Collections.Generic;
    
    public partial class Rezbilgi
    {
        public string Rezno { get; set; }
        public int Mno { get; set; }
        public string Yemekno { get; set; }
        public string Grupno { get; set; }
        public string Raftingücret { get; set; }
    
        public virtual Gruplar Gruplar { get; set; }
        public virtual Lokanta Lokanta { get; set; }
        public virtual Müsterikayıt Müsterikayıt { get; set; }
    }
}
