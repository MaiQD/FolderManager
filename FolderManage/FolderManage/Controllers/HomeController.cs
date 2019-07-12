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
		/// <summary>
		/// HIển thị danh sách 
		/// </summary>
		/// <param name="id"></param>
		/// <param name="q"></param>
		/// <returns></returns>
		public ActionResult Index(int? id, string q)
		{
			List<File> files = new List<File>() ;
			if (string.IsNullOrEmpty(q))
			{
				if (!id.HasValue)
				{
					id = 2;
				}
				files = DataProvider.Entities.Files.Where(p => p.ParentId == id).ToList();
				int? pid = DataProvider.Entities.Files.Where(p => p.Id == id).First().ParentId;
				ViewBag.ParentID = pid.HasValue ? pid : 2;
				ViewBag.CurrentID = id;
			}
			else
			{
				files = DataProvider.Entities.Files.Where(p => p.FolderName.Contains(q)).ToList();
			}
			
			return View(files);
		}
		/// <summary>
		/// tạo mới Folder
		/// </summary>
		/// <param name="ParentId"></param>
		/// <param name="name"></param>
		/// <returns></returns>
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
		/// <summary>
		/// Cập nhật Folder
		/// </summary>
		/// <param name="id"></param>
		/// <param name="name"></param>
		/// <returns></returns>
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
		/// <summary>
		/// lấy dữ liệu từ id
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
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
		/// <summary>
		/// Side bar
		/// </summary>
		/// <returns></returns>
		public ActionResult MyTree()
		{
			return View(DataProvider.Entities.Files.Where(p => !p.ParentId.HasValue));
		}
		/// <summary>
		/// Gửi file media
		/// </summary>
		/// <param name="file"></param>
		/// <param name="ParentId"></param>
		/// <returns></returns>
		public JsonResult PushFile(HttpPostedFileBase file, int? ParentId)
		{
			try
			{
				if (file!= null && file.ContentLength>0 && ParentId.HasValue)
				{
					string fileEx = System.IO.Path.GetExtension(file.FileName);
					string fileName = file.FileName.Length > 200 ? file.FileName.Substring(0, 200) : file.FileName;
					file.SaveAs(Server.MapPath("~/Content/media/" + fileName));
					int fileType =16;
					switch (fileEx)
					{
						case ".m4a": case ".mp3":
							fileType = 11;
							break;
						case ".mp4":
						case ".m4v":
						case ".mp4v":
						case ".3g2":
						case ".3gp":
						case ".3gpp":
							fileType = 12;
							break;
						case ".jpg":
						case ".png":
							fileType = 14;
							break;
						case ".txt":
						case ".doc":
						case ".docx":
							fileType = 15;
							break;
						default:
							fileType = 16;
							break;
					}
					File obj = new File();
					obj.CreateBy = "MaiQD";
					obj.CreatedDate = DateTime.Now;
					obj.FolderName = fileName;
					obj.ParentId = ParentId;
					obj.FileType = fileType;
					DataProvider.Entities.Files.Add(obj);
					DataProvider.Entities.SaveChanges();
					return Json("thành công", JsonRequestBehavior.AllowGet);
				}
			}
			catch (Exception ex)
			{

				return Json("", JsonRequestBehavior.AllowGet);
			}
			return Json("", JsonRequestBehavior.AllowGet);
		}
		/// <summary>
		/// hành động xóa
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public JsonResult Delete(int? id)
		{
			try
			{
				if (id.HasValue)
				{
					ClearChildNode((int)id);
					DataProvider.Entities.SaveChanges();
					return Json("Thành công", JsonRequestBehavior.AllowGet);
				}
			}
			catch (Exception ex)
			{

				return Json("", JsonRequestBehavior.AllowGet);
			}
			return Json("", JsonRequestBehavior.AllowGet);
		}
		/// <summary>
		/// hàm xóa các node con
		/// </summary>
		/// <param name="idRoot"></param>
		public void ClearChildNode(int idRoot)
		{
			if (DataProvider.Entities.Files.Where(p=>p.ParentId== idRoot).Count()>0)
			{
				foreach (File item in DataProvider.Entities.Files.Where(p => p.ParentId == idRoot))
				{
					ClearChildNode(item.Id);
				}
			}
			var objMedia = DataProvider.Entities.Files.Find(idRoot);
			// xóa ở server
			if (objMedia.FileType!= 1)
			{
				System.IO.File.Delete(Server.MapPath("~/Content/media/"+objMedia.FolderName));
			}
			DataProvider.Entities.Files.Remove(DataProvider.Entities.Files.Find(idRoot));
			
			return;
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