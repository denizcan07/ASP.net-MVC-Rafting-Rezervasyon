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
    
    public partial class Lokanta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Lokanta()
        {
            this.Rezbilgi = new HashSet<Rezbilgi>();
        }
    
        public string Yemekno { get; set; }
        public string Yemektürü { get; set; }
        public string Ücret { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rezbilgi> Rezbilgi { get; set; }
    }
}
