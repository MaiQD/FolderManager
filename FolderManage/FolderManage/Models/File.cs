namespace FolderManage.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class File
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public File()
        {
            Files1 = new HashSet<File>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(200)]
        public string FolderName { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(200)]
        public string CreateBy { get; set; }

        public int? ParentId { get; set; }

        public int? FileType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files1 { get; set; }

        public virtual File File1 { get; set; }

        public virtual FileType FileType1 { get; set; }
    }
}
