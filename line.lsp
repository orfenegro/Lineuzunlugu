(defun c:LL() 
;Lisp dosyamız her zaman defun c: ile başlıyor LL ise bizim koyduğumuz kısa yol tuşu istediğiniz herhangi bir kısa yol atayabilirsiniz.

(setq eName(car (entsel "Çizgi seçiniz: ")))
;entsel komutuyla önce seçilen nesnenin adını ve kordinatını alıyoruz
;car komutuyla gelen bilgideki ilk veriyi alıyoruz yani ad
;setq komutuyla gelen adı eName adlı değişkene atıyoruz.

(setq eData(entget eName))
;entget komutuyla eName'e atadığımız objenin özelliklerini AutoLISP DXF ;formatında alıp eData değişkenine atıyoruz.

(setq stp (cdr (assoc 10 eData)))
;assoc komutuyla eData listemizdeki key'i 10 olan değeri alıyoruz.
;cdr komutuyla ilk elementi almıyoruz.
;setq komutuyla aldığımız değeri stp değişkenine atıyoruz.


(setq endp (cdr (assoc 11 eData)))
;yukardakiyle aynı işlemleri bu sefer listemizdeki 11 key değeri için yapıyoruz.

(setq len (distance stp endp))
;distance komutuyla yukarda değişkenlere atadığımız değerler arasındaki mesafeyi ;bulup len değişkenine atıyoruz.

(entmake (list (cons 0 "TEXT")(cons 10 stp)(cons 40 1)(cons 50 0.0)(cons 1 (rtos len 2 2))))
;cons fonksiyonu ile listemizin parçalarını oluşturup sonra list ile liste haline ;getiriyoruz daha sonra entmake komutuyla text entity yaratıyoruz.

);end