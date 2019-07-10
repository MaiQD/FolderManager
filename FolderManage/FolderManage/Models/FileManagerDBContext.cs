namespace FolderManage.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class FileManagerDBContext : DbContext
	{
		public FileManagerDBContext()
			: base("name=FileManagerDBContext")
		{
		}

		public virtual DbSet<File> Files { get; set; }
		public virtual DbSet<FileType> FileTypes { get; set; }
		public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<File>()
				.HasMany(e => e.Files1)
				.WithOptional(e => e.File1)
				.HasForeignKey(e => e.ParentId);

			modelBuilder.Entity<FileType>()
				.HasMany(e => e.Files)
				.WithOptional(e => e.FileType1)
				.HasForeignKey(e => e.FileType);
		}
	}
}
