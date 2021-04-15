using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using kodfestdeneme.Models.Veritabanı;
namespace kodfestdeneme.Controllers
{
    public class HomeController : Controller
    {
        vtEntities db = new vtEntities();
        // GET: Home
        public ActionResult Index()
        {


            
           
            return View();
        }

        
         public ActionResult Services()
        {



            var liste = db.Müsterikayıt.ToList();
            

            return View(liste);
        }
       
        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }
       [HttpPost]
        public ActionResult Ekle(Müsterikayıt P)
        {
            db.Müsterikayıt.Add(P);
            db.SaveChanges();
            return RedirectToAction("Services");
        }
        public ActionResult SIL(int id)
        {
            var liste = db.Müsterikayıt.Find(id);
               db.Müsterikayıt.Remove(liste);
            db.SaveChanges();
            return RedirectToAction("Services");
        }
        public ActionResult BilgiGetir(int id)
        {
            var güncelle = db.Müsterikayıt.Find(id);
            return View("BilgiGetir", güncelle);
        }
     
       public ActionResult Güncelle(Müsterikayıt P)
        {
            var güncelle = db.Müsterikayıt.Find(P.Mno);    
            güncelle.Tc = P.Tc;
            güncelle.Ad = P.Ad;
            güncelle.Soyad = P.Soyad;
            güncelle.Telefon = P.Telefon;
            güncelle.Email = P.Email;
            güncelle.Reztarih = P.Reztarih;
            güncelle.Kisisayı = P.Kisisayı;
            db.SaveChanges();
            return RedirectToAction("Services");
        }
       
    } 
}