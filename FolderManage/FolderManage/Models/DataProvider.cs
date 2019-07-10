using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FolderManage.Models
{
	public class DataProvider
	{
		static private FileManagerDBContext _Entities = null;

		static public FileManagerDBContext Entities {
			get
			{
				if (_Entities == null)
				{
					_Entities = new FileManagerDBContext();
				}
				return _Entities;

			}
			private set { }
		}
	}
}