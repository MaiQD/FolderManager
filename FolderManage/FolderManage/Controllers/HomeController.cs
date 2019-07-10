using FolderManage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FolderManage.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index(int? id)
		{
			if (!id.HasValue)
			{
				id = 2;
			}
			List<File> files = DataProvider.Entities.Files.Where(p => p.ParentId == id).ToList();
			int? pid = DataProvider.Entities.Files.Where(p => p.Id == id).First().ParentId;
			ViewBag.ParentID = pid.HasValue?pid:2;
			ViewBag.CurrentID = id;
			return View(files);
		}
		public JsonResult CreateFolder(int? ParentId , string name)
		{
			if (!string.IsNullOrEmpty(name))
			{
				try
				{
					File file = new File();
					file.CreateBy = "MaiQD";
					file.CreatedDate = DateTime.Now;
					file.ParentId = ParentId;
					file.FolderName = name;
					file.FileType = 1;

					DataProvider.Entities.Files.Add(file);
					DataProvider.Entities.SaveChanges();
					return Json("thành công", JsonRequestBehavior.AllowGet);
				}
				catch (Exception ex)
				{

					return Json("", JsonRequestBehavior.AllowGet);
				}
				
			}
			return Json("",JsonRequestBehavior.AllowGet);
		}
		public JsonResult UpdateFolder(int? id, string name)
		{
			if (id!=null && id.HasValue && id>0 && !string.IsNullOrEmpty(name))
			{
				try
				{
					File file = DataProvider.Entities.Files.Find(id);
					file.FolderName = name;

					DataProvider.Entities.SaveChanges();
					return Json("thành công", JsonRequestBehavior.AllowGet);
				}
				catch (Exception ex)
				{

					return Json("", JsonRequestBehavior.AllowGet);
				}

			}
			return Json("", JsonRequestBehavior.AllowGet);
		}
		public JsonResult GetObjById(int? id)
		{
			if (id != null && id.HasValue)
			{
				try
				{
					File file = DataProvider.Entities.Files.Find(id);
					File objReturn = new File();
					objReturn.Id = file.Id;
					objReturn.ParentId = file.ParentId;
					objReturn.FolderName = file.FolderName;
					objReturn.CreatedDate = file.CreatedDate;
					objReturn.CreateBy = file.CreateBy;
					return Json(objReturn, JsonRequestBehavior.AllowGet);
				}
				catch (Exception ex)
				{

					return Json("", JsonRequestBehavior.AllowGet);
				}
			}
			return Json("", JsonRequestBehavior.AllowGet);
		}

		public ActionResult About()
		{
			ViewBag.Message = "Your application description page.";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}
	}
}